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


!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 11:52:07'!
test01CanPutXOnAnEmptyBoard
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	
	self deny: game isWon! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 11:53:07'!
test02CannotPutAnOOnAnEmptyBoard
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #o at: 1@1 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotTurnFor: #o) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 11:56:17'!
test03CanPutOAfterX
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	
	game put: #o at: 1@2.

	self deny: game isWon ! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 11:59:07'!
test04CannotPutAnXRightAfterAnX
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	self 
		should: [ game put: #x at: 1@2 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotTurnFor: #x) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 12:12:11'!
test05CannotPutAnORightAfterAnO
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	game put: #o at: 1@2.

	self 
		should: [ game put: #o at: 1@3 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotTurnFor: #o) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 13:40:11'!
test06CanPutPieceOnTakenPlace
	|game| 
	game := TerniLapilli new.
	
	game put: #x at: 1@1.
	
	self 
		should: [ game put: #o at: 1@1 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorPlaceAlreadyTaken) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 14:29:18'!
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
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorCannotPutMoreTokens) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 14:50:15'!
test08CannotPutATokenWithXLowerThan1
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 0@3 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 0@3) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 15:11:32'!
test09CannotPutATokenWithXGreaterThan3
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 4@3 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 4@3) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 15:13:47'!
test10CannotPutATokenWithYGreaterThan3
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 3@4 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 3@4) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:05:39'!
test11CannotPutATokenWithYLowerThan1
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 2@0 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 2@0) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:05:31'!
test12CannotPutATokenWithYGreaterThan3
	|game| 
	game := TerniLapilli new.
	
	self 
		should: [ game put: #x at: 3@4 ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: (TerniLapilli errorNotAValidPoint: 3@4) ].
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:28:10'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:27:10'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 05:33:44'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 05:36:52'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:02:16'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:04:32'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:06:23'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:10:32'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:13:00'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:36:15'!
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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 08:34:10'!
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


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'tokens nextPlayer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:13:20'!
ascendingDiagonalPositions
	^ Array with: 1@3 with: 2@2 with: 3@1! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:30:26'!
at: aPoint put: aToken 
	aToken = nextPlayer ifFalse: [ self error: (self class errorNotTurnFor: aToken)].
	
	(tokens includesKey: aPoint) ifTrue: [self error: (self class errorPlaceAlreadyTaken)].
	
	(tokens size = 6) ifTrue: [self error: (self class errorCannotPutMoreTokens)].
	
	self ensureValidPosition: aPoint.
	
	tokens at: aPoint put: aToken.
	
	aToken = #x 
		ifTrue: [ 
			nextPlayer := #o.
		]
		ifFalse: [
			nextPlayer := #x
		].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:11:46'!
descendingDiagonalPositions
	^ Array with: 1@1 with: 2@2 with: 3@3! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:03:21'!
firstColumnPositions
	^ Array with: 1@1 with: 2@1 with: 3@1! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 05:46:08'!
firstRowPositions
	^ Array with: 1@1 with: 1@2 with: 1@3! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 05:59:14'!
hasWon: aToken
	^self winningPositions anySatisfy:  
		[ :positions | self hasWon: aToken withPositions: positions] .
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 05:47:55'!
hasWon: aToken withPositions: winningPositions
	^winningPositions allSatisfy: [ :aPosition | self includes: aToken at: aPosition].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:19:57'!
includes: aToken at: aPoint 
	^ aToken = (tokens at: aPoint ifAbsent: [#empty]) 
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 12:10:21'!
initialize
	tokens := Dictionary new.
	nextPlayer := #x.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:23:35'!
isWon
	^ self xHasWon or: self oHasWon! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:23:22'!
oHasWon
	^ self hasWon: #o! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 15:20:42'!
put: aToken at: aPoint 
	aToken = nextPlayer ifFalse: [ self error: (self class errorNotTurnFor: aToken)].
	
	(tokens includesKey: aPoint) ifTrue: [self error: (self class errorPlaceAlreadyTaken)].
	
	(tokens size = 6) ifTrue: [self error: (self class errorCannotPutMoreTokens)].
	
	self ensureValidPosition: aPoint.
	
	tokens at: aPoint put: aToken.
	
	aToken = #x 
		ifTrue: [ 
			nextPlayer := #o.
		]
		ifFalse: [
			nextPlayer := #x
		].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:04:56'!
secondColumnPositions
	^ Array with: 1@2 with: 2@2 with: 3@2! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 05:49:59'!
secondRowPositions
	^ Array with: 2@1 with: 2@2 with: 2@3! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:30:26'!
slide: aStartingPosition to: anEndingPosition
	|tokenToMove|
	tokenToMove := tokens removeKey: aStartingPosition.
	tokens at: tokenToMove put: anEndingPosition.
! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:07:44'!
thirdColumnPositions
	^ Array with: 1@3 with: 2@3 with: 3@3! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 05:50:57'!
thirdRowPositions
	^ Array with: 3@1 with: 3@2 with: 3@3! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/27/2019 06:13:37'!
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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DHS 5/26/2019 16:27:27'!
xHasWon
	^ self hasWon: #x! !


!TerniLapilli methodsFor: 'private' stamp: 'DHS 5/26/2019 15:29:23'!
ensureValidCoordinate: aCoordinate withError: anErrorMessage
	(self isValidCoordinate: aCoordinate)
		ifFalse: [self error: anErrorMessage].
! !

!TerniLapilli methodsFor: 'private' stamp: 'DHS 5/26/2019 15:33:39'!
ensureValidPosition: aPoint 
	self ensureValidXCoordinate: aPoint.
	self ensureValidYCoordinate: aPoint.
! !

!TerniLapilli methodsFor: 'private' stamp: 'DHS 5/26/2019 15:32:52'!
ensureValidXCoordinate: aPoint 
	self ensureValidCoordinate: aPoint x withError: (self class errorNotAValidPoint: aPoint).
! !

!TerniLapilli methodsFor: 'private' stamp: 'DHS 5/26/2019 15:33:03'!
ensureValidYCoordinate: aPoint 
	self ensureValidCoordinate: aPoint y withError: (self class errorNotAValidPoint: aPoint).
! !

!TerniLapilli methodsFor: 'private' stamp: 'DHS 5/26/2019 15:24:25'!
isValidCoordinate: aCoordinate
	^aCoordinate  between: 1 and: 3
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/26/2019 14:35:05'!
errorCannotPutMoreTokens
	^'Cannot put more Pieces on the board' ! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/26/2019 15:09:16'!
errorNotAValidPoint: aPoint 
	^'Cannot put a piece at ', aPoint asString ! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/25/2019 23:16:06'!
errorNotTurnFor: aToken
	^'It is not the turn for ', aToken.! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'DHS 5/26/2019 13:43:41'!
errorPlaceAlreadyTaken
	^'Place already taken'! !
