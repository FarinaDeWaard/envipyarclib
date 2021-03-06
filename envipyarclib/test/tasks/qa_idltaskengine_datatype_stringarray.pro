;+
; :Description:
;    Task to test IDL task engine of IDL STRINGARRAY datatype
;    See qa_idltaskengine_datatype_stringarray.task for details
;       
; :Author:
;    GG, March, 2016 - Initial Draft
;-
pro qa_idltaskengine_datatype_stringarray, INPUT=input, $
                                        OUTPUT=output, $
                                        EXPECT_DIMENSIONS=expectDims
                                   
  compile_opt idl2
  
  expectType = 7
  
  isType = Size(input,/TYPE)
  if (isType NE expectType) then begin
    Message, 'INPUT is not of expected type. IS: ' + $
      String(isType) + ' EXPECT: ' + String(expectType)
  endif

  if (~Isa(input, /ARRAY)) then begin
    Message, 'INPUT is not an array.'
  endif
  
  if (Isa(input, 'Collection')) then begin
    Message, 'INPUT is a collection and should not be.'
  endif
  help,expectDims
  print,expectDims
  isDimensions = (Fix(Size(input,/DIMENSIONS), TYPE=expectType)).Trim()
  help,isDimensions
  print,isDimensions
  if (~ARRAY_EQUAL(isDimensions,expectDims)) then begin
    Message, 'INPUT is not of expected dimensions. IS: ' + $
      (isDimensions.ToString()).Join(',') + ' EXPECT:' + $
      (expectDims.ToString()).Join(',')
  endif

  output = input
  
end
