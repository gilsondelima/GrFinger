{
 -------------------------------------------------------------------------------
 GrFinger Sample
 (c) 2005 - 2010 Griaule Biometrics Ltda.
 http://www.griaulebiometrics.com
 -------------------------------------------------------------------------------

 This sample is provided with "GrFinger Fingerprint Recognition Library" and
 can't run without it. It's provided just as an example of using GrFinger
 Fingerprint Recognition Library and should not be used as basis for any
 commercial product.

 Griaule Biometrics makes no representations concerning either the merchantability
 of this software or the suitability of this sample for any particular purpose.

 THIS SAMPLE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL GRIAULE BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 You can download the trial version of GrFinger directly from Griaule website.
                                                                   
 These notices must be retained in any copies of any part of this
 documentation and/or sample.

 -------------------------------------------------------------------------------
}

// -----------------------------------------------------------------------------------
// Database routines
// -----------------------------------------------------------------------------------

unit uDBClass;

interface

uses
  ADODB, DB, classes, SysUtils, GrFinger;

const
  // the database we'll be connecting to
  DBFile = '..\DB\GrFingerSample.mdb';
  ConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + DBFile;

type
  // Class TTemplate
  // Define a type to temporary storage of template
  TTemplate = class
    public
      // Template data.
      tpt:        Pchar;
      // Template size
      size:       Integer;
      // Template ID (if retrieved from DB)
      id:         Integer;

      // Allocates space to template
      constructor Create;
      // clean-up
      destructor Destroy; override;
  end;

  TDBClass = class
  private
    // a data set to mantain all templates of database
    dsTemplates: TADODataSet;
    // the connection object
    connection: TADOConnection;
    // Template object used to get a template from database.
    tptBlob: TTemplate;
  public
    function openDB(): boolean;
    procedure closeDB();
    procedure clearDB();
    function addTemplate(template: TTemplate): Integer;
    procedure getTemplates();
    function getTemplate(id: Integer) : TTemplate;
    function getNextTemplate(): TTemplate;

  end;

implementation

// Default constructor
constructor TTemplate.Create();
begin
  // Allocate memory for template and initialize its size to 0
  tpt := AllocMem(GR_MAX_SIZE_TEMPLATE);
  size := 0;
end;

// Default destructor
destructor TTemplate.Destroy();
begin
  // free resources
  FreeMemory(tpt);
end;

// Open connection
function TDBClass.openDB(): boolean;
begin
  try
        dsTemplates := TADODataSet.Create(nil);
        tptBlob := TTemplate.Create();
        connection := TADOConnection.Create(nil);
        connection.ConnectionString := ConnectionString;
        connection.Open();
        openDB := true;
  except
        openDB := false;
  end;
end;

// Close conection
procedure TDBClass.closeDB();
begin
  dsTemplates.Close();
  dsTemplates.Free();
  tptBlob.Free();
  connection.Close();
  connection.Free();
  connection := nil;
end;

// Clear database
procedure TDBClass.clearDB();
begin
  // run "clear" query
  connection.Execute('DELETE FROM enroll');
end;

// Add template to database. Returns added template ID.
function TDBClass.addTemplate(template: TTemplate): Integer;
var
  rs: TADODataSet;
  tptStream: TMemoryStream;
  id: Integer;
begin
  // get DB data and append one row
  rs := TADODataSet.Create(nil);
  rs.Connection := connection;
  rs.CursorType := ctStatic;
  rs.LockType := ltOptimistic;
  rs.CommandText := 'SELECT * FROM enroll';
  rs.Open();
  rs.Append();
  tptStream := TMemoryStream.Create();
  // write template data to memory stream.
  tptStream.write(template.tpt^, template.size);
  // save template data from memory stream to database.
  (rs.FieldByName('template') as  TBlobField).LoadFromStream(tptStream);
  // update database with added template.
  rs.post();
  // get the ID of enrolled template.
  id := rs.FieldByName('ID').AsInteger;
  // close connection
  tptStream.Free();
  rs.Close();
  rs.Free();
  addTemplate := id;
end;

// Start fetching all enrolled templates from database.
procedure TDBClass.getTemplates();
begin
  dsTemplates.Close();
  dsTemplates.CacheSize := 15000;
  dsTemplates.CursorLocation := clUseClient;
  dsTemplates.CursorType := ctOpenForwardOnly;
  dsTemplates.LockType := ltReadOnly;
  dsTemplates.Connection := connection;
  dsTemplates.CommandText := 'SELECT * FROM enroll';
  dsTemplates.Open();
  dsTemplates.BlockReadSize := 15000;
end;

// Returns template with supplied ID.
function TDBClass.getTemplate(id: Integer): TTemplate;
Var
  template: TTemplate;
begin
  dsTemplates.Close();
  dsTemplates.Connection := connection;
  dsTemplates.CursorType := ctDynamic;
  dsTemplates.LockType := ltReadOnly;
  dsTemplates.CommandText := 'SELECT * FROM enroll WHERE ID = ' + IntToStr(id);
  // Get query response
  dsTemplates.Open();
  // Deserialize template and return it
  template := getNextTemplate();
  dsTemplates.Close();
  getTemplate := template;
end;

// Return next template from dataset
function TDBClass.getNextTemplate(): TTemplate;
Var
  tmp: String;
begin
  // No results?
  if dsTemplates.Eof then
  begin
    tptBlob.size := -1;
    getNextTemplate := tptBlob;
  end else
  begin
    // Get template ID from database
    tptBlob.id := dsTemplates.FieldByName('ID').AsInteger;
    // Get template data from database as string.
    tmp := dsTemplates.FieldByName('template').AsString;
    // Get template size from database.
    tptBlob.size := length(tmp);
    // Move template data from temporary string
    // to template object.
    Move(PChar(tmp)^, tptBlob.tpt^, tptBlob.size);
    // move foward in the list of templates
    dsTemplates.Next();
    getNextTemplate := tptBlob;
  end;
end;

end.
