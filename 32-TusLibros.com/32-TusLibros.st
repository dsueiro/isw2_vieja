!classDefinition: #TusLibrosTest category: #'32-TusLibros'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '32-TusLibros'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'GSC 6/3/2019 02:21:48'!
test01emptyCartHaveNoBooksInside
	| cart |
	
	cart _ Cart withCatalog: OrderedCollection new. 
	
	self assert: cart books size equals: 0.
! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'GSC 6/3/2019 02:44:34'!
test02addABookToACartMakesACartWithOneMoreProductsInside
	| cart aBook |
	
	aBook _ 'isbn book 1'.
	cart _ Cart withCatalog: (OrderedCollection with: aBook). 
	
	cart addABook: aBook quantity: 2.
	
	self assert: cart books size equals: 1.
	self assert: (cart books at: aBook) equals: 2.
! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'GSC 6/3/2019 02:44:44'!
test03addABookTwiceToACartMakesACartWithOneMoreProductsInside
	| cart aBook |
	
	aBook _ 'isbn book 1'.
	cart _ Cart withCatalog: (OrderedCollection with: aBook). 
	
	cart addABook: aBook quantity: 2.
	cart addABook: aBook quantity: 1.
	
	self assert: cart books size equals: 1.
	self assert: (cart books at: aBook) equals: 3.
	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'GSC 6/3/2019 02:31:20'!
test04CantAddABookWithNegativeQuantity
	| cart aBook |
	
	cart _ Cart withCatalog: OrderedCollection new. 
	aBook _ 'isbn book 1'.

	self 
		should: [ cart addABook: aBook quantity: -2. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cart cantAddABookWithNegativeQuantity.
		].! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'GSC 6/3/2019 02:50:32'!
test05CantAddABookThatIsNotInTheCatalogue
	| cart aBook |
	
	cart _ Cart withCatalog: (OrderedCollection new). 

	self 
		should: [ cart addABook: aBook quantity: 2. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cart cantAddABookThatIsNotInTheCatalogue.
		].! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'GSC 6/3/2019 02:47:17'!
test06CantAddABookWithNoIntegerQuantities
	| cart aBook |
	
	cart _ Cart withCatalog: OrderedCollection new. 
	aBook _ 'isbn book 1'.

	self 
		should: [ cart addABook: aBook quantity: 3/2. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cart cantAddABookWithNoIntegerQuanitities.
		].! !


!classDefinition: #Cart category: #'32-TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'books catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: '32-TusLibros'!

!Cart methodsFor: 'accessing' stamp: 'GSC 6/3/2019 01:36:47'!
books
	^ books ! !

!Cart methodsFor: 'accessing' stamp: 'GSC 6/3/2019 02:44:13'!
catalogue
	^ catalogue! !


!Cart methodsFor: 'initialization' stamp: 'GSC 6/3/2019 02:23:56'!
initializeWithCatalogue: aCatalogue
	books _ Dictionary new.
	catalogue _ aCatalogue.
	! !


!Cart methodsFor: 'adding books' stamp: 'GSC 6/3/2019 02:54:58'!
addABook: aBook quantity: aQuantity
	| previousBookQuantity |
	
	aQuantity negative ifTrue: [self error: self class cantAddABookWithNegativeQuantity ].
	aQuantity isInteger ifFalse: [self error: self class cantAddABookWithNoIntegerQuanitities ].
	(self catalogue includes: aBook) ifFalse: [self error: self class cantAddABookThatIsNotInTheCatalogue ].
	
	
	previousBookQuantity _ books at: aBook ifAbsent: 0. 
	books add: aBook -> (previousBookQuantity + aQuantity).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'32-TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error messages' stamp: 'GSC 6/3/2019 02:42:21'!
cantAddABookThatIsNotInTheCatalogue
	^ 'Cannot add a book that is not in the catalogue'.! !

!Cart class methodsFor: 'error messages' stamp: 'GSC 6/3/2019 02:15:01'!
cantAddABookWithNegativeQuantity
	^ 'Cannot add a book with negative quantity'! !

!Cart class methodsFor: 'error messages' stamp: 'GSC 6/3/2019 02:52:05'!
cantAddABookWithNoIntegerQuanitities
	^ 'Cannot add a book with no integer quantities'.! !


!Cart class methodsFor: 'class initialization' stamp: 'GSC 6/3/2019 02:24:31'!
withCatalog: aCatalogue
	^ self new initializeWithCatalogue: aCatalogue ! !
