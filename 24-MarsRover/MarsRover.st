!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/10/2019 23:27:37'!
test01
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: ''.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/10/2019 23:39:14'!
test02
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals: 1@2.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/10/2019 23:57:57'!
test03
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'b'.
	
	self assert: marsRover position equals: 1@0.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:26:10'!
test04
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'ff'.
	
	self assert: marsRover position equals: 1@3.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:38:58'!
test05
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #east.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals: 2@1.
	self assert: marsRover heading equals: #east.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:39:28'!
test06
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals:0@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:48:41'!
test07
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'b'.
	
	self assert: marsRover position equals: 2@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:50:34'!
test08
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:53:54'!
test09
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #south.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:56:49'!
test10
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #south.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #east.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:57:53'!
test11
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #east.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 09:39:49'!
test12
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #north.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #east.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 09:41:17'!
test13
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #east.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #south.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 09:42:08'!
test14
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #south.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #west.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 10:05:30'!
test15
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: #west.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: #north.
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 23:51:52'!
test16
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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/12/2019 00:21:47'!
at: aPoint heading: aDirection 
	position := aPoint.
	heading := aDirection.
		! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:46:17'!
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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:36:17'!
heading
	^heading ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/12/2019 00:40:47'!
initialize
	processors := Array 
		with: MoveBackwards new 
		with: MoveForward new
		with: TurnLeft new
		with: TurnRight new.
		! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/10/2019 23:25:42'!
isAt: aPoint heading: aSymbol 
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:48:08'!
moveBackwards	
	position := position - self direction
	
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:46:41'!
moveForward
	position := position + self direction
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/10/2019 23:57:22'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/12/2019 00:41:06'!
processCommand: aCommand
	| command |
	command := processors  detect: [ :processor | processor handles: aCommand ]
		ifNone: [ 
			self error: self class unknownCommand .	
		].
	
	command move: self
	
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 23:32:09'!
sendCommand: aString
	aString do: [ :aCommand | self processCommand: aCommand ].
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 00:58:36'!
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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'dhs 5/11/2019 10:01:38'!
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
