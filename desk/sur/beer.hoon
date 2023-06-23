::  /sur/beer/hoon
|%
::  confidence of statement
+$  beer
  $?  %gat :: No information. Could be real, or not.
      %get :: Possibly real, secondhand.
      %git :: Possibly real, firsthand.
      %got :: Definitely real, secondhand.
      %gut :: Definitely real, firsthand.
  ==

+$  beer-action
  $%  [%add =ship =beer]
  ==
  
--
::  statement
:: +$  toast
::   $:
::       from=@p
::       to=@p
::       timestamp=@da
::       id=@ud
::       =beer
::   ==
