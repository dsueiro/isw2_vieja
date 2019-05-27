!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!
!TerniLapilliTest commentStamp: '<historical>' prior: 0!
- Que no puedo colocar una O luego de una O
- Que no puedo ocupar un lugar ya ocupado
- Que puedo colocar una X luego de una-  O
- Que no puedo colocar una X luego de que pusieron 3 cada una
- Que no puedo colocar fuera de [1..3]x[1..3]
- Que puedo detectar que no ganó
- Que puedo detectar todas las variantes de ganar, con X y con O
	- Lineas 1 a 3
	- Columans 1 a 3
	- Diagonal 1 y 2
- Que puedo hacer un slide si ya están todas las piezas
- Que no puedo hacer slide si faltan piezas por colocar
- Que X puede hacer slide si no ganó y es su turno
- Que O no puede jugar si no es su turno
- Que O puede jugar si no ganó y es su turno
- Que X no puede ganar si no ganó y no es su turno
- Que nadie puede jugar si ya se ganó
- Que no se puede mover ficha de otro?
- Que no se puede mover un espacio donde no hay ficha
- Que sólo se puede mover a lugares contiguos
	- esquinas
	- medios
	- centros
- Que no se puede mover a donde hay una ficha ocupada 
	
 
!


!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/26/2019 11:52:07'!
test01CanPutXOnAnEmptyBoard
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	
	self deny: game isWon! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:20:38'!
test02CannotPutAnOOnAnEmptyBoard
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #o at: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotTurnFor: #o) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/26/2019 11:56:17'!
test03CanPutOAfterX
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	
	game put: #o at: 1@2.

	self deny: game isWon ! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:20:45'!
test04CannotPutAnXRightAfterAnX
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	self 
		should: [ game put: #x at: 1@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotTurnFor: #x) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:20:50'!
test05CannotPutAnORightAfterAnO
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 1@2.

	self 
		should: [ game put: #o at: 1@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotTurnFor: #o) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:20:54'!
test06CanPutPieceOnTakenPlace
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	
	self 
		should: [ game put: #o at: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorPlaceAlreadyTaken) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:20:59'!
test07CannotPutMoreThan3Tokens
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 1@2.
	game put: #x at: 1@3.
	game put: #o at: 2@2.
	game put: #x at: 3@2.
	game put: #o at: 3@1.
	
	self 
		should: [ game put: #x at: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorCannotPutMoreTokens) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:04'!
test08CannotPutATokenWithXLowerThan1
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 0@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 0@3) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:08'!
test09CannotPutATokenWithXGreaterThan3
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 4@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 4@3) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:13'!
test10CannotPutATokenWithYGreaterThan3
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 3@4 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 3@4) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:17'!
test11CannotPutATokenWithYLowerThan1
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 2@0 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 2@0) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:21'!
test12CannotPutATokenWithYGreaterThan3
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 3@4 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 3@4) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/26/2019 16:28:10'!
test13CanRecognizeXWonGameInFirstRow
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@2.
	game put: #x at: 1@2.
	game put: #o at: 3@2.
	game put: #x at: 1@3.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/26/2019 16:27:10'!
test14CanRecognizeOWonGameInFirstRow
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 2@1.
	game put: #o at: 1@1.
	game put: #x at: 2@2.
	game put: #o at: 1@2.
	game put: #x at: 3@3.
	game put: #o at: 1@3.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 05:33:44'!
test15CanRecognizeWonGameInSecondRow
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 1@2.
	game put: #o at: 2@2.
	game put: #x at: 3@3.
	game put: #o at: 2@3.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 05:36:52'!
test16CanRecognizeWonGameInThirdRow
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 3@1.
	game put: #o at: 2@1.
	game put: #x at: 3@2.
	game put: #o at: 2@2.
	game put: #x at: 3@3.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 06:02:16'!
test17CanRecognizeWonGameInFirstColumn
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@2.
	game put: #x at: 2@1.
	game put: #o at: 2@3.
	game put: #x at: 3@1.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 06:04:32'!
test18CanRecognizeWonGameInSecondColumn
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 1@2.
	game put: #x at: 2@1.
	game put: #o at: 2@2.
	game put: #x at: 3@3.
	game put: #o at: 3@2.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 06:06:23'!
test19CanRecognizeWonGameInThirdColumn
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@3.
	game put: #o at: 1@2.
	game put: #x at: 2@3.
	game put: #o at: 2@2.
	game put: #x at: 3@3.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 06:10:32'!
test20CanRecognizeWonGameInDescendingDiagonal
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 3@3.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 06:13:00'!
test21CanRecognizeWonGameInAscendingDiagonal
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@3.
	game put: #o at: 2@3.
	game put: #x at: 2@2.
	game put: #o at: 3@3.
	game put: #x at: 3@1.

	self assert: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 06:36:15'!
test22CanRecognizeWonGameInDescendingDiagonal
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 1@3.

	self deny: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 08:34:10'!
test23CanSlideToken
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 1@3.
	game put: #o at: 1@2.
	
	game slide: 1@3 to: 2@3.

	self deny: game isWon.	
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:35'!
test24CannotSlideYet
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 1@3.
	
	self 
		should: [ game slide: 3@1 to: 3@2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: (TerniLapilli errorCannotSlideYet).
			self assert: (game isEmptyAt: 3@2).
			].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:41'!
test25CannotSlideFromEmptyPosition
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 1@3.
	game put: #o at: 1@2.
	
	self 
		should: [ game slide: 3@2 to: 3@3. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: (TerniLapilli errorStartPositionIsEmpty).
			].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:49'!
test26CannotSlideToTakenPosition
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 1@3.
	game put: #o at: 1@2.
	
	self 
		should: [ game slide: 2@2 to: 2@1. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: (TerniLapilli errorEndPositionIsTaken).
			].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:21:53'!
test27CannotSlideIfNotItsTurn
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 1@3.
	game put: #o at: 1@2.
	
	self 
		should: [ game slide: 3@1 to: 3@2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: (TerniLapilli errorNotTurnFor: #o).
			].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:07:05'!
test28CanSlideXAfterO
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 1@3.
	game put: #o at: 1@2.

	game slide: 2@2 to: 2@3.	
	game slide: 3@1 to: 3@2.	
	game slide: 2@3 to: 2@2.	

	self deny: game isWon! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 09:24:07'!
test29CannotMoveTwoPlacesToTheLeft
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 2@2.
	game put: #o at: 3@1.
	game put: #x at: 3@2.
	game put: #o at: 3@3.

	self 
		should: [ game slide: 1@1 to: 1@3. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: (TerniLapilli errorInvalidDirection).
			self assert: (game isEmptyAt: 1@3).
			].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 09:38:47'!
test30CanMoveLeftDownwards
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 1@2.
	game put: #o at: 1@3.
	game put: #x at: 2@2.
	game put: #o at: 3@2.

	game slide: 2@2 to: 3@1.
	
	self deny: game isWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 09:39:52'!
test31CanMoveRightDownwards
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 1@2.
	game put: #o at: 1@3.
	game put: #x at: 2@2.
	game put: #o at: 3@2.

	game slide: 2@2 to: 3@3.
	
	self deny: game isWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 09:45:07'!
test32CanMoveRightUpwards
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 1@2.
	game put: #o at: 3@2.
	game put: #x at: 2@2.
	game put: #o at: 2@3.

	game slide: 2@2 to: 1@3.
	
	self assert: game isWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 09:46:57'!
test33CanMoveUpwards
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 2@1.
	game put: #o at: 3@1.
	game put: #x at: 2@2.
	game put: #o at: 3@2.
	game put: #x at: 1@3.
	game put: #o at: 2@3.

	game slide: 2@2 to: 1@2.
	
	self deny: game isWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 09:47:53'!
test34CanMoveLeftUpwards
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 2@1.
	game put: #o at: 3@1.
	game put: #x at: 2@2.
	game put: #o at: 3@2.
	game put: #x at: 1@3.
	game put: #o at: 2@3.

	game slide: 2@2 to: 1@1.
	
	self deny: game isWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:08:19'!
test35CanMoveOutsideOfTheBoard
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 2@1.
	game put: #o at: 3@1.
	game put: #x at: 2@2.
	game put: #o at: 3@2.
	game put: #x at: 1@3.
	game put: #o at: 2@3.

	self 
	should: [ game slide: 1@3 to: 0@3. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError | 
		self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 0@3).
		].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:22:10'!
test36CoordinatesAreInteger
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 1.5@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 1.5@3) ].
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 10:35:09'!
test37CannotPutPieceAfterIsWon
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 2@1.
	game put: #x at: 1@2.
	game put: #o at: 2@2.
	game put: #x at: 1@3.

	self 
		should: [ game put: #o at: 2@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorAlreadyWon) ].
	
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'DHS 5/27/2019 12:16:04'!
test38CannotSlidePieceAfterIsWon
        |game|
        game := TerniLapilli new.

        game put: #x at: 1@1.
        game put: #o at: 3@1.
        game put: #x at: 1@2.
        game put: #o at: 3@2.
        game put: #x at: 2@3.
        game put: #o at: 3@3.

        self
                should: [ game slide: 2@3 to: 1@3 ]
                raise: Error - MessageNotUnderstood
                withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorAlreadyWon) ].! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'tokens nextPlayer state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/27/2019 09:30:56'!
ensure: aStartingPoint isNextTo: anEndingPoint 
	^ (self validSlidingDirections includes: anEndingPoint - aStartingPoint)
		ifFalse: [self error: self class errorInvalidDirection]! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/27/2019 11:15:43'!
ensureCanPut
	(tokens size = 6) ifTrue: [self error: (self class errorCannotPutMoreTokens)].
	self ensureIsNotWon.
! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/27/2019 11:18:13'!
ensureCanSlide
	tokens size < 6 ifTrue: [self error: self class errorCannotSlideYet .].
	self ensureIsNotWon.
! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/27/2019 10:34:43'!
ensureIsNotWon
	self isWon ifTrue: [ self error: self class errorAlreadyWon ]! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/26/2019 15:29:23'!
ensureValidCoordinate: aCoordinate withError: anErrorMessage
	(self isValidCoordinate: aCoordinate)
		ifFalse: [self error: anErrorMessage].
! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/26/2019 15:33:39'!
ensureValidPosition: aPoint 
	self ensureValidXCoordinate: aPoint.
	self ensureValidYCoordinate: aPoint.
! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/27/2019 08:51:46'!
ensureValidTurnFor: aToken
	aToken = nextPlayer ifFalse: [ self error: (self class errorNotTurnFor: aToken)].
! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/26/2019 15:32:52'!
ensureValidXCoordinate: aPoint 
	self ensureValidCoordinate: aPoint x withError: (self class errorNotAValidPoint: aPoint).
! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/26/2019 15:33:03'!
ensureValidYCoordinate: aPoint 
	self ensureValidCoordinate: aPoint y withError: (self class errorNotAValidPoint: aPoint).
! !

!TerniLapilli methodsFor: 'validations' stamp: 'DHS 5/27/2019 05:50:57'!
thirdRowPositions
	^ Array with: 3@1 with: 3@2 with: 3@3! !


!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 06:13:20'!
ascendingDiagonalPositions
	^ Array with: 1@3 with: 2@2 with: 3@1! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 06:11:46'!
descendingDiagonalPositions
	^ Array with: 1@1 with: 2@2 with: 3@3! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 06:03:21'!
firstColumnPositions
	^ Array with: 1@1 with: 2@1 with: 3@1! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 05:46:08'!
firstRowPositions
	^ Array with: 1@1 with: 1@2 with: 1@3! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 05:59:14'!
hasWon: aToken
	^self winningPositions anySatisfy:  
		[ :positions | self hasWon: aToken withPositions: positions] .
! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 05:47:55'!
hasWon: aToken withPositions: winningPositions
	^winningPositions allSatisfy: [ :aPosition | self includes: aToken at: aPosition].! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/26/2019 16:23:35'!
isWon
	^ self xHasWon or: self oHasWon! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/26/2019 16:23:22'!
oHasWon
	^ self hasWon: #o! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 06:04:56'!
secondColumnPositions
	^ Array with: 1@2 with: 2@2 with: 3@2! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 05:49:59'!
secondRowPositions
	^ Array with: 2@1 with: 2@2 with: 2@3! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 06:07:44'!
thirdColumnPositions
	^ Array with: 1@3 with: 2@3 with: 3@3! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/27/2019 06:13:37'!
winningPositions
	|positions|
	positions := OrderedCollection new.
	
	positions add: self firstRowPositions .
	positions add: self secondRowPositions .
	positions add: self thirdRowPositions .

	positions add: self firstColumnPositions .
	positions add: self secondColumnPositions .
	positions add: self thirdColumnPositions .

	positions add: self descendingDiagonalPositions .
	positions add: self ascendingDiagonalPositions .
	
	^positions! !

!TerniLapilli methodsFor: 'won game testing' stamp: 'DHS 5/26/2019 16:27:27'!
xHasWon
	^ self hasWon: #x! !


!TerniLapilli methodsFor: 'valid moves' stamp: 'DHS 5/27/2019 09:48:17'!
validSlidingDirections
	|validDirections|
	validDirections := OrderedCollection new.
	validDirections add: 1@0.
	validDirections add: -1@0.
	
	validDirections add: 0@1.
	validDirections add: 0@-1.
	
	validDirections add: 1@-1.
	validDirections add: 1@1.
	validDirections add: -1@1.
	validDirections add: -1@-1.

	^validDirections! !


!TerniLapilli methodsFor: 'playing' stamp: 'DHS 5/27/2019 13:39:26'!
put: aToken at: aPoint 
	self ensureValidTurnFor: aToken.
	
	self validatePutPosition: aPoint.
	
	state ensureCanPut.
	
	tokens at: aPoint put: aToken.
	
	self setNextPlayer: aToken.
	self setState
! !

!TerniLapilli methodsFor: 'playing' stamp: 'DHS 5/27/2019 11:33:06'!
slide: aStartingPosition to: anEndingPosition
	|tokenToMove|
	
	self ensureCanSlide.
	
	(tokens includesKey: anEndingPosition) ifTrue: [self error: self class errorEndPositionIsTaken].
	
	self ensureValidPosition: anEndingPosition.
	self ensure: aStartingPosition isNextTo: anEndingPosition.
	
	tokenToMove := tokens removeKey: aStartingPosition ifAbsent: [self error: self class errorStartPositionIsEmpty].
	
	self ensureValidTurnFor: tokenToMove.
	tokens at: anEndingPosition put: tokenToMove.
	
	self setNextPlayer: tokenToMove.
	self setState
! !

!TerniLapilli methodsFor: 'playing' stamp: 'DHS 5/27/2019 11:17:11'!
validatePutPosition: aPoint
	(tokens includesKey: aPoint) ifTrue: [self error: (self class errorPlaceAlreadyTaken)].	
	self ensureValidPosition: aPoint.
! !


!TerniLapilli methodsFor: 'initialization' stamp: 'DHS 5/27/2019 11:32:39'!
initialize
	tokens := Dictionary new.
	nextPlayer := #x.
	state := TerniLapilliPutting new! !


!TerniLapilli methodsFor: 'board state' stamp: 'DHS 5/27/2019 12:17:09'!
allPiecesPut
	^tokens size = 6! !

!TerniLapilli methodsFor: 'board state' stamp: 'DHS 5/26/2019 16:19:57'!
includes: aToken at: aPoint 
	^ aToken = (tokens at: aPoint ifAbsent: [#empty]) 
	! !

!TerniLapilli methodsFor: 'board state' stamp: 'DHS 5/27/2019 08:41:33'!
isEmptyAt: aPoint 
	^ (tokens includesKey: aPoint) not! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 10:15:05'!
setNextPlayer: aToken
	aToken = #x 
		ifTrue: [ 
			nextPlayer := #o.
		]
		ifFalse: [
			nextPlayer := #x
		].! !


!TerniLapilli methodsFor: 'private' stamp: 'DHS 5/27/2019 10:17:03'!
isValidCoordinate: aCoordinate
	"Nos pareció más simple que chequear en un rango y además que sea entero"
	^aCoordinate  = 1 or: aCoordinate = 2 or: aCoordinate = 3
! !


!TerniLapilli methodsFor: 'state' stamp: 'DHS 5/27/2019 11:31:46'!
setState
	state := TerniLapilliState stateFor: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/27/2019 10:33:02'!
errorAlreadyWon
	^ 'Cannot play after the game is won'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/26/2019 14:35:05'!
errorCannotPutMoreTokens
	^'Cannot put more Pieces on the board' ! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/27/2019 08:39:57'!
errorCannotSlideYet
	^'Cannot slide yet'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/27/2019 08:49:14'!
errorEndPositionIsTaken
	^'End position is Taken'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/27/2019 09:22:58'!
errorInvalidDirection
	^'Invalid direction'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/26/2019 15:09:16'!
errorNotAValidPoint: aPoint 
	^'Cannot put a piece at ', aPoint asString ! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/25/2019 23:16:06'!
errorNotTurnFor: aToken
	^'It is not the turn for ', aToken.! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/26/2019 13:43:41'!
errorPlaceAlreadyTaken
	^'Place already taken'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/27/2019 08:46:00'!
errorStartPositionIsEmpty
	^'Start position is Empty'! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'validations' stamp: 'DHS 5/27/2019 13:38:35'!
ensureCanPut
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'subclass creation' stamp: 'DHS 5/27/2019 13:42:20'!
stateFor: aGame
	| subclass |
	subclass := self allSubclasses detect: [ :aStateClass | aStateClass isCurrentStateFor: aGame ].
	^subclass new.! !


!TerniLapilliState class methodsFor: 'testing' stamp: 'DHS 5/27/2019 11:30:01'!
isCurrentStateFor: aGame
	self subclassResponsibility ! !


!classDefinition: #TerniLapilliPutting category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliPutting
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliPutting methodsFor: 'validations' stamp: 'DHS 5/27/2019 13:36:54'!
ensureCanPut
	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliPutting class' category: #TerniLapilli!
TerniLapilliPutting class
	instanceVariableNames: ''!

!TerniLapilliPutting class methodsFor: 'testing' stamp: 'DHS 5/27/2019 11:30:01'!
isCurrentStateFor: aGame
	^aGame isWon not and: aGame allPiecesPut not! !


!classDefinition: #TerniLapilliSliding category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliSliding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliSliding methodsFor: 'validations' stamp: 'DHS 5/27/2019 13:37:43'!
ensureCanPut
	self error: (TerniLapilli errorCannotPutMoreTokens)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliSliding class' category: #TerniLapilli!
TerniLapilliSliding class
	instanceVariableNames: ''!

!TerniLapilliSliding class methodsFor: 'testing' stamp: 'DHS 5/27/2019 11:30:01'!
isCurrentStateFor: aGame
	^aGame isWon not and: aGame allPiecesPut! !


!classDefinition: #TerniLapilliWon category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliWon methodsFor: 'validations' stamp: 'DHS 5/27/2019 13:42:40'!
ensureCanPut
	self error: TerniLapilli errorAlreadyWon! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliWon class' category: #TerniLapilli!
TerniLapilliWon class
	instanceVariableNames: ''!

!TerniLapilliWon class methodsFor: 'testing' stamp: 'DHS 5/27/2019 11:30:01'!
isCurrentStateFor: aGame
	^aGame isWon! !
