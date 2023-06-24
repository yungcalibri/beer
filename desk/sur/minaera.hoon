|%
++  aera-schema
:~  [%id [0 | %ud]]
    [%timestamp [1 | %da]]   ::  timestamp ideally provided by event, not timestamp of insertion into database
    [%from [2 | %p]]
    [%to [3 | %p]]
    [%what [4 | %t]]         ::  optional `term` which describes a recorded value 
    [%tag [5 | %t]]          ::  Sanitizer-defined tag
    [%description [6 | %t]]  ::  English language description of event, keep under 140 characres.
    [%app-tag [7 | %tas]]    :: The head tag of the action item in the app the event is from
    [%event-version [8 | %ud]]     :: The version number of this event
==
::
+$  aera-row
  $:  id=@ud
      timestamp=@da
      from=@p
      to=@p
      what=@t
      tag=@tas
      description=@tas
      app-tag=@tas
      event-version=@ud
      ~
  ==
::
+$  aera-action
  $%  [%init-table app=term feed=term]
      [%add-edge app=term feed=term =aera-row]
      [%placeholder ~]
  ==
--