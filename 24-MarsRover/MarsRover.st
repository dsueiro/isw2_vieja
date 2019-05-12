!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 00:58:20'!
test01GivenAnEmptyListOfCommandsTheRoverStaysQuiet
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: ''.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 00:58:54'!
test02GoingForwardWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals: 1@2.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:25:02'!
test03GoingBackwardsWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'b'.
	
	self assert: marsRover position equals: 1@0.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:25:36'!
test04SendingManyCommands
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'ff'.
	
	self assert: marsRover position equals: 1@3.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:30:34'!
test05GoingForwardWhileHeadingEast
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #east.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals: 2@1.
	self assert: marsRover heading equals: #east.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:31:07'!
test06GoingForwardWhileHeadingWest
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals:0@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:35:54'!
test07GoingBackwards
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'b'.
	
	self assert: marsRover position equals: 2@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:35:19'!
test08TurningLeftWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:34:48'!
test09TurningLeftWhileHeadingWest
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #south.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:34:19'!
test10TurningLeftWhileHeadingSouth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #south.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #east.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:33:42'!
test11TurningLeftWhileHeadingEast
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #east.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:33:21'!
test12TurningRightWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #east.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:37:29'!
test13TurningRightWhileHeadingEast
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #east.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #south.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:32:19'!
test14TurningRightWhileHeadingSouth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #south.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:31:54'!
test15TurningRighWhileHeadingWest
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/12/2019 01:26:45'!
test16SendingUnknownCommand
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	self should: [
		marsRover sendCommand: 'xf'
	]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :exception |
		self assert: marsRover position equals: 1@1.
		self assert: marsRover heading equals: #west.  
	]
	description: MarsRover unknownCommand.
	
	
	! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading processors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/11/2019 00:48:08'!
moveBackwards	
	position := position - self direction
	
! !

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/11/2019 00:46:41'!
moveForward
	position := position + self direction
! !

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/11/2019 00:58:36'!
turnLeft
	heading = #north ifTrue: [
		^heading := #west
	].
	heading = #west ifTrue: [
		^heading := #south
	].
	heading = #south ifTrue: [
		^heading := #east
	].
	heading = #east ifTrue: [
		^heading := #north
	].! !

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/11/2019 10:01:38'!
turnRight
	heading = #north ifTrue: [
		^heading := #east
	].
	heading = #east ifTrue: [
		^heading := #south
	].
	heading = #south ifTrue: [
		^heading := #west
	].
	heading = #west ifTrue: [
		^heading := #north
	].! !


!MarsRover methodsFor: 'testing' stamp: 'dhs 5/11/2019 00:46:17'!
direction
	heading  = #north ifTrue: [
		^ 0@1
	].
	heading  = #south ifTrue: [
		^ 0@-1
	].
	heading  = #east ifTrue: [
		^ 1@0
	].
	heading  = #west ifTrue: [
		^ -1@0
	].
! !

!MarsRover methodsFor: 'testing' stamp: 'dhs 5/11/2019 00:36:17'!
heading
	^heading ! !

!MarsRover methodsFor: 'testing' stamp: 'dhs 5/10/2019 23:57:22'!
position
	^position! !


!MarsRover methodsFor: 'command processing' stamp: 'dhs 5/12/2019 00:41:06'!
processCommand: aCommand
	| command |
	command := processors  detect: [ :processor | processor handles: aCommand ]
		ifNone: [ 
			self error: self class unknownCommand .	
		].
	
	command move: self
	
! !

!MarsRover methodsFor: 'command processing' stamp: 'dhs 5/11/2019 23:32:09'!
sendCommand: aString
	aString do: [ :aCommand | self processCommand: aCommand ].
! !


!MarsRover methodsFor: 'initialization' stamp: 'dhs 5/12/2019 00:21:47'!
at: aPoint heading: aDirection 
	position := aPoint.
	heading := aDirection.
		! !

!MarsRover methodsFor: 'initialization' stamp: 'dhs 5/12/2019 00:40:47'!
initialize
	processors := Array 
		with: MoveBackwards new 
		with: MoveForward new
		with: TurnLeft new
		with: TurnRight new.
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'dhs 5/10/2019 23:24:37'!
at: aPosition heading: aDirection 
	^self new at: aPosition heading: aDirection.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 12:26:56'!
unknownCommand
	^'Unknown Command' ! !


!classDefinition: #MarsRoverMove category: #MarsRover!
Object subclass: #MarsRoverMove
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverMove methodsFor: 'processing' stamp: 'dhs 5/12/2019 00:51:20'!
move
	self subclassResponsibility ! !


!MarsRoverMove methodsFor: 'testing' stamp: 'dhs 5/12/2019 00:51:07'!
handles: aCommand
	self subclassResponsibility ! !


!classDefinition: #MoveBackwards category: #MarsRover!
MarsRoverMove subclass: #MoveBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveBackwards methodsFor: 'processing' stamp: 'dhs 5/11/2019 11:29:06'!
move: rover
	rover moveBackwards 
	! !


!MoveBackwards methodsFor: 'testing' stamp: 'dhs 5/11/2019 11:42:42'!
handles: command
	^command == $b
	! !


!classDefinition: #MoveForward category: #MarsRover!
MarsRoverMove subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveForward methodsFor: 'testing' stamp: 'dhs 5/12/2019 00:48:53'!
handles: command
	^command == $f
	! !


!MoveForward methodsFor: 'processing' stamp: 'dhs 5/11/2019 11:30:23'!
move: rover
	rover moveForward 
	! !


!classDefinition: #TurnLeft category: #MarsRover!
MarsRoverMove subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnLeft methodsFor: 'testing' stamp: 'dhs 5/12/2019 00:49:07'!
handles: command
	^command == $l
	! !


!TurnLeft methodsFor: 'processing' stamp: 'dhs 5/11/2019 11:30:36'!
move: rover
	rover turnLeft
	! !


!classDefinition: #TurnRight category: #MarsRover!
MarsRoverMove subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnRight methodsFor: 'testing' stamp: 'dhs 5/12/2019 00:49:23'!
handles: command
	^command == $r
	! !


!TurnRight methodsFor: 'processing' stamp: 'dhs 5/11/2019 11:30:51'!
move: rover
	rover turnRight 
	! !
