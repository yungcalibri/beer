/-  *beer
/+  verb, dbug, default-agent
|%
::
+$  versioned-state
  $%  state-0
  ==
::  Our state is a map from @p to beer.
::  Only the most recent beer is stored for each @p.
::
+$  state-0  [%0 bar=(map @p beer)]
::
+$  card  card:agent:gall
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
  [~ this]
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
++  on-poke
  |=  =cage
  ~>  %bout.[0 '%beer +on-poke']
  ^-  (quip card _this)
  ?+    -.cage  !!
      %beer-action
    =/  act  !<(beer-action +.cage)
    `this(bar.state (~(put by bar.state) ship.act beer.act))
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
