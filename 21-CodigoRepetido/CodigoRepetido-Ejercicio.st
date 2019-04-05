!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'anEmptyCustomerBook johnLennon paulMcCartney fiftyMilliseconds aCustomerBookWithPaulMcCartney aCustomerBookWithJohnLennon oneHundredMilliseconds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 20:24:44'!
assert: aBlock failsWithError: anException andVerifies: anAssertionBlock 

	[ aBlock value.
	self fail ]
		on: anException 
		do: anAssertionBlock! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:01:40'!
assert: customerBook hasActive: numberOfActiveCustomers andHasSuspended: numberOfSuspendedCustomers
	
	self assert: numberOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: (numberOfActiveCustomers + numberOfSuspendedCustomers) equals: customerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:37:04'!
assert: customerBook hasOnlyOneCustomerNamed: aCustomer

	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: aCustomer) 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:19:06'!
assert: customerBook hasThisNumberOfActiveCustomers: numberOfActiveCustomers andHasThisNumberOfSuspendedCustomers: numberOfSuspendedCustomers
	
	self assert: numberOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: (numberOfActiveCustomers + numberOfSuspendedCustomers) equals: customerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 19:58:39'!
assert: aBlock takesLessThan: aTimeInterval

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.

	self assert: (millisecondsAfterRunning - millisecondsBeforeRunning) < (aTimeInterval)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:32:40'!
setUp
	anEmptyCustomerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	
	aCustomerBookWithPaulMcCartney := CustomerBook new.
	aCustomerBookWithPaulMcCartney addCustomerNamed: paulMcCartney.
	
	aCustomerBookWithJohnLennon := CustomerBook new.
	aCustomerBookWithJohnLennon addCustomerNamed: johnLennon.
	
	fiftyMilliseconds := 50 * millisecond.
	oneHundredMilliseconds := 100 * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:21:51'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |

	customerBook := anEmptyCustomerBook.
	
	self assert: [customerBook addCustomerNamed: johnLennon ] takesLessThan: fiftyMilliseconds. 
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:32:52'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := aCustomerBookWithPaulMcCartney .
	
	self assert: [customerBook removeCustomerNamed: paulMcCartney] takesLessThan: oneHundredMilliseconds 
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:31:43'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := anEmptyCustomerBook.

	self assert: [customerBook addCustomerNamed: ''] 
		failsWithError: Error 
		andVerifies: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:40:05'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := aCustomerBookWithJohnLennon.
	
	self assert: [customerBook removeCustomerNamed: paulMcCartney ]
		failsWithError: NotFound
		andVerifies: [ :anError | 
			self assert: customerBook hasOnlyOneCustomerNamed: johnLennon ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:25:47'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook|
	
	customerBook := aCustomerBookWithPaulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: customerBook hasActive: 0 andHasSuspended: 1. 
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:39:43'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook|
	
	customerBook := aCustomerBookWithPaulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: customerBook hasActive: 0 andHasSuspended: 0. 
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:39:26'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := aCustomerBookWithJohnLennon.
	
	self assert: [customerBook suspendCustomerNamed: paulMcCartney ] 
		failsWithError: CantSuspend 
		andVerifies: [ :anError | 
			self assert: customerBook hasOnlyOneCustomerNamed: johnLennon ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'dhs 4/4/2019 21:39:09'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook := aCustomerBookWithJohnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self assert: [customerBook suspendCustomerNamed: johnLennon]
		failsWithError: CantSuspend 
		andVerifies: [ :anError | 
			self assert: customerBook hasOnlyOneCustomerNamed: johnLennon ]
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'dhs 4/4/2019 22:06:41'!
removeCustomerNamed: aName 
 
	^self removeCustomerNamed: aName fromCollection: active ifNotFound:
		[
		
			self removeCustomerNamed: aName fromCollection: suspended ifNotFound: [ NotFound signal ]
		]
	
	.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'dhs 4/4/2019 22:05:13'!
removeCustomerNamed: aName fromCollection: aCollection ifNotFound: notFoundBlockHandler
 
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName 
			] 
	].

	notFoundBlockHandler value! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:22'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:31'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
