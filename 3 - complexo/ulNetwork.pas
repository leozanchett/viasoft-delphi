unit ulNetwork;

interface

uses
  System.Classes;

type
   iNetwork = interface
      ['{488B8EB0-9FA2-4769-8828-FA242B7A160A}']
      procedure Connect(const _PElement_1, _PElement_2: Integer);
      function Query(const _PVerify_Element_1, _PVerify_Element_2: Integer): String;
      function Conections: TStringList;
   end;

implementation

end.
