/-  *beer, *minaera
/+  verb, dbug, default-agent
|%
::
+$  versioned-state
  $%  state-0
  ==
::  Our state is a map from @p to beer.
::  Only the most recent beer is stored for each @p.
::
+$  state-0  [%0 bar=(map @p beer) count=@ud]
::
+$  card  card:agent:gall
::
++  minaera-init-card
|=  =ship
[%pass /minaera/action %agent [ship %minaera] %poke %aera-action !>([%init-table %beer %beer])]
--
::
%+  verb  &
%-  agent:dbug
=|  state=state-0
::
^-  agent:gall
::
|_  =bowl:gall
+*  this  .
    def  ~(. (default-agent this %|) bowl)
++  on-fail
  ~>  %bout.[0 '%beer +on-fail']
  on-fail:def
::
++  on-leave
  ~>  %bout.[0 '%beer +on-leave']
  on-leave:def
::
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^-  (quip card _this)
  [~ this]
::
++  on-init
  ^-  (quip card _this)
  ~>  %bout.[0 '%beer +on-init']
  :-  ~[(minaera-init-card our.bowl)]
  this
::
++  on-save
  ^-  vase
  ~>  %bout.[0 '%beer +on-save']
  !>(state)
::
++  on-load
  |=  old=vase
  ~>  %bout.[0 '%beer +on-load']
  ^-  (quip card _this)
  =/  new-state=state-0  !<(state-0 old)
  [~ this(state new-state)]
::
::+$  aera-row
::  $:  id=@ud              count
::      timestamp=@da       now.bowl
::      from=@p             our.bowl
::      to=@p               ship.act
::      what=@t             ~ 
::      tag=@tas            beer.act
::      description=@tas    "Attestation of identity"
::      app-tag=@tas        %add
::      event-version=@ud   %0
::      ~
::  ==
++  on-poke
  |=  =cage
  ~>  %bout.[0 '%beer +on-poke']
  ^-  (quip card _this)
  ?+    -.cage  !!
      %beer-action
    =/  act  !<(beer-action +.cage)
    =/  edge=aera-row
    :~  count.state
        now.bowl
        our.bowl
        ship.act
        ''
        beer.act
        %'Attestation of identity'
        %add
        %0
    ==
    =.  count.state  +(count.state)
    :_  this(bar.state (~(put by bar.state) ship.act beer.act))
    :~  :*  %pass  /minaera/action  %agent  [our.bowl %minaera]  
            %poke  %aera-action  !>(`aera-action`[%add-edge %beer %beer edge])
    ==  ==
  ==
::
++  on-peek
  |=  =path
  ~>  %bout.[0 '%beer +on-peek']
  ^-  (unit (unit cage))
  ~
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ~>  %bout.[0 '%beer +on-agent']
  ^-  (quip card _this)
  [~ this]
::
++  on-watch
  |=  =path
  ~>  %bout.[0 '%beer +on-watch']
  ^-  (quip card _this)
  [~ this]
--
