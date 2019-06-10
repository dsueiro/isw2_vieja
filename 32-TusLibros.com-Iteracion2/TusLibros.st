!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'DHS 6/10/2019 17:57:32'!
createCart
	
	^Cart acceptingItemsOf: self defaultPriceList! !

!CartTest methodsFor: 'support' stamp: 'DHS 6/10/2019 17:59:13'!
defaultPriceList
	| dictionary |
	dictionary := Dictionary new.
	dictionary add: self itemSellByTheStore -> 1. 
	^dictionary
! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 18:04:06'!
createCart
	
	^Cart acceptingItemsOf: self defaultPriceList! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:53:52'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 18:02:57'!
defaultPriceList
	| dictionary |
	dictionary := Dictionary new.
	dictionary add: self itemSellByTheStore -> 1. 
	^dictionary
! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 18:01:54'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:47:00'!
test01
	| card cashier cart |
	card := Creditcard number: '1234123412431234' of: 'Juan Perez' expiringOn: (GregorianMonthOfYear year: 2019  monthNumber: 1). 
	
	cart := nil.
	self 
		should: [ cashier := Cashier for: cart  withCard: card on: (FixedGregorianDate fromDate: (Date newDay: 12 month: #July year: 2099))]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier expiredCardError.
			self assert: cashier isNil.
		].
! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:24:53'!
test01
	|card|
	
	self 
		should: [ card := Creditcard number: '1234' of: 'Juan Perez' expiringOn: nil]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Creditcard invalidCardNumberError.
			self assert: card isNil.
			]! !

!CreditCardTest methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:25:25'!
test02
	|card|
	
	self 
		should: [ card := Creditcard number: '1234123412341234' of: '' expiringOn: nil]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Creditcard invalidOwnerError.
			self assert: card isNil.
			]! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'DHS 6/10/2019 17:58:20'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'DHS 6/10/2019 18:01:23'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart card currentDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:37:44'!
initializeFor: aCart withCard: aCreditcard on: aDate 
	cart := aCart.
	card := aCreditcard.
	currentDate := aDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:40:15'!
expiredCardError
	^'Cannot start a checkout with an expired card'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:49:09'!
for: aCart withCard: aCreditcard on: aDate 
	[aCreditcard isExpiredOn: aDate] ifTrue: [ ^self error: self expiredCardError  ].
	^self new initializeFor: aCart withCard: aCreditcard on: aDate! !


!classDefinition: #Creditcard category: #TusLibros!
Object subclass: #Creditcard
	instanceVariableNames: 'number name expiresOn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Creditcard methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:15:23'!
initializeWithNumber: aNumber of: aName expiringOn: aMonthOfAYear
	number := aNumber.
	name := aName.
	expiresOn := aMonthOfAYear ! !

!Creditcard methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:48:39'!
isExpiredOn: aGregorianDate
	^expiresOn < aGregorianDate monthOfYear  ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Creditcard class' category: #TusLibros!
Creditcard class
	instanceVariableNames: ''!

!Creditcard class methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:21:09'!
cardNumberSize
	^16! !

!Creditcard class methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:22:26'!
invalidCardNumberError
	^'Credit card number should be a string of length ', self cardNumberSize asString ! !

!Creditcard class methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:27:31'!
invalidOwnerError
	^'Credit cards needs a non empty owner name' ! !

!Creditcard class methodsFor: 'as yet unclassified' stamp: 'DHS 6/10/2019 17:26:52'!
number: aCardNumber of: aName expiringOn: aMonthOfAYear 
	aCardNumber asString size ~= self cardNumberSize ifTrue: [ ^ self error: self invalidCardNumberError ].
	aName asString isEmpty ifTrue: [ ^ self error: self invalidOwnerError ].
	
	^self new initializeWithNumber: aCardNumber of: aName expiringOn: aMonthOfAYear.! !
