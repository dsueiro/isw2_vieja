!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:41'!
test01GivenAnEmptyListOfCommandsTheRoverStaysQuiet
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingNorth new.
	
	marsRover sendCommand: ''.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingNorth new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:41'!
test02GoingForwardWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingNorth new.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals: 1@2.
	self assert: marsRover heading equals: HeadingNorth new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:41'!
test03GoingBackwardsWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingNorth new.
	
	marsRover sendCommand: 'b'.
	
	self assert: marsRover position equals: 1@0.
	self assert: marsRover heading equals: HeadingNorth new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:41'!
test04SendingManyCommands
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingNorth new.
	
	marsRover sendCommand: 'ff'.
	
	self assert: marsRover position equals: 1@3.
	self assert: marsRover heading equals: HeadingNorth new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:15'!
test05GoingForwardWhileHeadingEast
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingEast  new.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals: 2@1.
	self assert: marsRover heading equals: HeadingEast new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:38:24'!
test06GoingForwardWhileHeadingWest
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingWest  new.
	
	marsRover sendCommand: 'f'.
	
	self assert: marsRover position equals:0@1.
	self assert: marsRover heading equals: HeadingWest new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:38:24'!
test07GoingBackwards
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingWest new.
	
	marsRover sendCommand: 'b'.
	
	self assert: marsRover position equals: 2@1.
	self assert: marsRover heading equals: HeadingWest new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:38:24'!
test08TurningLeftWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingNorth new.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingWest new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:38:24'!
test09TurningLeftWhileHeadingWest
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingWest new.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingSouth new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:57'!
test10TurningLeftWhileHeadingSouth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingSouth new.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingEast new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:41'!
test11TurningLeftWhileHeadingEast
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingEast new.
	
	marsRover sendCommand: 'l'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingNorth  new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:41'!
test12TurningRightWhileHeadingNorth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingNorth new.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingEast new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:37:57'!
test13TurningRightWhileHeadingEast
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingEast new.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingSouth new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:38:24'!
test14TurningRightWhileHeadingSouth
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingSouth new.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingWest new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:38:24'!
test15TurningRighWhileHeadingWest
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingWest new.
	
	marsRover sendCommand: 'r'.
	
	self assert: marsRover position equals: 1@1.
	self assert: marsRover heading equals: HeadingNorth new.
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'dhs 5/13/2019 06:38:24'!
test16SendingUnknownCommand
	| marsRover |
	marsRover := MarsRover at: 1@1 heading: HeadingWest new.
	
	self should: [
		marsRover sendCommand: 'xf'
	]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :exception |
		self assert: marsRover position equals: 1@1.
		self assert: marsRover heading equals: HeadingWest new.  
	]
	description: MarsRover unknownCommand.
	
	
	! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading commandProcessors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/12/2019 12:04:12'!
moveBackwards	
	position := position + self backwardsDirection
	
! !

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/12/2019 11:59:08'!
moveForward
	position := position + self forwardDirection
! !

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/12/2019 12:16:17'!
turnLeft
	heading := heading turnLeft
! !

!MarsRover methodsFor: 'moving' stamp: 'dhs 5/12/2019 12:18:10'!
turnRight
	heading := heading turnRight! !


!MarsRover methodsFor: 'testing' stamp: 'dhs 5/12/2019 12:05:17'!
backwardsDirection
	^heading  backwardsDirection 
! !

!MarsRover methodsFor: 'testing' stamp: 'dhs 5/12/2019 11:59:51'!
forwardDirection
	^heading  forwardDirection 
! !

!MarsRover methodsFor: 'testing' stamp: 'dhs 5/11/2019 00:36:17'!
heading
	^heading ! !

!MarsRover methodsFor: 'testing' stamp: 'dhs 5/10/2019 23:57:22'!
position
	^position! !


!MarsRover methodsFor: 'command processing' stamp: 'dhs 5/12/2019 12:20:17'!
processCommand: aCommand
	| commandProcessor |
	commandProcessor := commandProcessors  detect: [ :processor | processor handles: aCommand ]
		ifNone: [ 
			self error: self class unknownCommand .	
		].
	
	commandProcessor move: self
	
! !

!MarsRover methodsFor: 'command processing' stamp: 'dhs 5/12/2019 12:18:55'!
sendCommand: aCommandList
	aCommandList do: [ :aCommand | self processCommand: aCommand ].
! !


!MarsRover methodsFor: 'initialization' stamp: 'dhs 5/12/2019 00:21:47'!
at: aPoint heading: aDirection 
	position := aPoint.
	heading := aDirection.
		! !

!MarsRover methodsFor: 'initialization' stamp: 'dhs 5/12/2019 12:19:39'!
initialize
	commandProcessors := Array 
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


!classDefinition: #MarsRoverHeading category: #MarsRover!
Object subclass: #MarsRoverHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeading methodsFor: 'turning' stamp: 'dhs 5/12/2019 12:06:53'!
turnLeft
	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'turning' stamp: 'dhs 5/12/2019 12:06:59'!
turnRight
	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'dhs 5/12/2019 12:03:14'!
backwardsDirection
	^-1 * self forwardDirection ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'dhs 5/12/2019 11:54:25'!
forwardDirection
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: #MarsRover!
MarsRoverHeading class
	instanceVariableNames: 'uniqueInstance'!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'dhs 5/12/2019 11:48:45'!
new
	uniqueInstance ifNil: [
		uniqueInstance := self basicNew 
		].
	
	^uniqueInstance! !


!classDefinition: #HeadingEast category: #MarsRover!
MarsRoverHeading subclass: #HeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingEast methodsFor: 'moving' stamp: 'dhs 5/12/2019 11:55:22'!
forwardDirection
	^ 1@0
! !


!HeadingEast methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:37:41'!
turnLeft
	^HeadingNorth new! !

!HeadingEast methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:37:57'!
turnRight
	^HeadingSouth new! !


!classDefinition: #HeadingNorth category: #MarsRover!
MarsRoverHeading subclass: #HeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingNorth methodsFor: 'moving' stamp: 'dhs 5/12/2019 11:56:34'!
forwardDirection
	^ 0@1
! !


!HeadingNorth methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:38:24'!
turnLeft
	^HeadingWest new! !

!HeadingNorth methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:37:15'!
turnRight
	^HeadingEast new! !


!classDefinition: #HeadingSouth category: #MarsRover!
MarsRoverHeading subclass: #HeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingSouth methodsFor: 'moving' stamp: 'dhs 5/12/2019 11:57:19'!
forwardDirection
	^ 0@-1
! !


!HeadingSouth methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:37:15'!
turnLeft
	^HeadingEast new! !

!HeadingSouth methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:38:24'!
turnRight
	^HeadingWest new! !


!classDefinition: #HeadingWest category: #MarsRover!
MarsRoverHeading subclass: #HeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingWest methodsFor: 'moving' stamp: 'dhs 5/12/2019 11:58:16'!
forwardDirection
	^ -1@0
! !


!HeadingWest methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:37:57'!
turnLeft
	^HeadingSouth  new! !

!HeadingWest methodsFor: 'turning' stamp: 'dhs 5/13/2019 06:37:41'!
turnRight
	^HeadingNorth  new! !


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
