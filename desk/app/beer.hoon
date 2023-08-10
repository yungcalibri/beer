/-  *beer, *minaera, service
/+  verb, dbug, default-agent, *sss
|%
::
::  Basic reputation service
::
+$  versioned-state
  $%  state-0
  ==
::  Our state is a map from @p to beer.
::  Only the most recent beer is stored for each @p.
::
+$  state-0  [%0 bar=(map @p @)]
::
+$  card  card:agent:gall
::
++  minaera-init-card
|=  =ship
[%pass /minaera/action %agent [ship %minaera] %poke %aera-action !>([%init-table %beer %beer])]
::
++  info-card
=/  desc=@t
'''
Scale ranging from 0 to 1 inclusive
  - 0 mean that I haven't met the person.
  - 1 means that I've met the person.
'''
:*  desc=desc
    type=%discrete
    aura=%ud
    min=0
    max=1
==
--
::
%+  verb  &
%-  agent:dbug
=/  pub-service  (mk-pubs service ,[%service *])
=|  state=state-0 ::
^-  agent:gall
::
|_  =bowl:gall
+*  this  .
    def  ~(. (default-agent this %|) bowl)
    du-service  =/  du  (du service ,[%service *])
                  (du pub-service bowl -:!>(*result:du))
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
  !>([state pub-service])
::
++  on-load
  |=  =vase
  ~>  %bout.[0 '%beer +on-load']
  ^-  (quip card _this)
  =/  old  !<  [state-0 =_pub-service]  vase
  :-  ~
  %=    this
    state     -.old
    pub-service  pub-service.old
  ==
::
++  on-poke
  |=  [=mark =vase]
  ~>  %bout.[0 '%beer +on-poke']
  ^-  (quip card _this)
  ::  ~&  >>  "%beer: pub-service was: {<read:du-service>}"
  ?+    mark  !!
      %beer-action
    =/  act  !<(beer-action vase)
    =.  bar.state
      ?-    -.act
          %add
        (~(put by bar.state) ship.act `@`beer.act)
      ::
          %del 
        (~(del by bar.state) ship.act)
      ==
    =^  cards  pub-service  (give:du-service [%service %beer ~] act)
    [cards this]
    ::
      %sss-on-rock
    `this
    ::
      %sss-to-pub
    ?-   msg=!<(into:du-service (fled vase))
        [[%service *] *]
      =^  cards  pub-service  (apply:du-service msg)
      :: ~&  >>  "%beer: pub-service is: {<read:du-service>}"
      [cards this]
    ==
  ==
::
++  on-peek
  |=  =path
  ~>  %bout.[0 '%beer +on-peek']
  ^-  (unit (unit cage))
  ?+    path  `~
      [%x %score @ ~]
    =/  =ship  (slav %p -.+.+.path)
    ?.  (~(has by bar.state) ship)
      ``[%noun !>(~)]
    ``[%noun !>((~(get by bar.state) ship))]
  ::
      [%x %scores ~]
    ``[%noun !>(bar.state)]
  ::
      [%x %card ~]
    ``[%noun !>(info-card)]
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ~>  %bout.[0 '%beer +on-agent']
  ^-  (quip card _this)
  ?.  =(%poke-ack -.sign)
    ~&  >  beer+'bad poke'  `this
  ?+    wire  `this
      [~ %sss %scry-response @ @ @ %service *]
    =^  cards  pub-service  (tell:du-service |3:wire sign)
    ::  ~&  >  "%beer: pub-service is: {<read:du-service>}"
    [cards this]
  ==
::
++  on-watch
  |=  =path
  ~>  %bout.[0 '%beer +on-watch']
  ^-  (quip card _this)
  [~ this]
--