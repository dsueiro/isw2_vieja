!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 19:46:38'!
test01CannotLookUpEmptySentence
	|sentenceFinder|
	sentenceFinder  := SentenceFinderByPrefix  new.
	self
		should: [ sentenceFinder find: '' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix cannotLookUpEmptyPrefix ]
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 19:46:59'!
test02CannotLookUpWordWithSpaces
	|sentenceFinder|
	sentenceFinder  := SentenceFinderByPrefix  new.
	self
		should: [ sentenceFinder find: 'winter is coming']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix cannotLookUpPrefixWithSpaces ]
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 20:08:55'!
test03MatchesSearchedSentenceAndIsCaseSensitive
	|sentenceFinder result|
	sentenceFinder  := SentenceFinderByPrefix  new.
	sentenceFinder push: 'winter is coming'.
	sentenceFinder push: 'winning is everything'.
	sentenceFinder push: 'The winds of Winter'.
	sentenceFinder push: 'Winter is here'.  

	result := sentenceFinder find: 'Wint'.
	self assert: (result isKindOf: Collection).
	self assert: result size equals: 1.
	self assert: (result includes: 'Winter is here')! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 19:37:24'!
test04FindKeepsStackSize
	|sentenceFinder|
	sentenceFinder  := SentenceFinderByPrefix  new.
	sentenceFinder push: 'winter is coming'.
	sentenceFinder push: 'winning is everything'.
	sentenceFinder push: 'The winds of Winter'.
	sentenceFinder push: 'Winter is here'.  

	sentenceFinder find: 'Wint'.
	
	self assert: sentenceFinder size equals: 4! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 19:37:52'!
test05FindKeepsSentencesOrder
	|sentenceFinder|
	sentenceFinder  := SentenceFinderByPrefix  new.
	sentenceFinder push: 'winter is coming'.
	sentenceFinder push: 'winning is everything'.
	sentenceFinder push: 'The winds of Winter'.
	sentenceFinder push: 'Winter is here'.  

	sentenceFinder find: 'Wint'.
	
	self assert: sentenceFinder pop equals: 'Winter is here'.
	self assert: sentenceFinder pop equals: 'The winds of Winter'.
	self assert: sentenceFinder pop equals: 'winning is everything'.
	self assert: sentenceFinder pop equals: 'winter is coming'.
	self assert: sentenceFinder isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 19:40:52'!
test06TheResultOfLookingForANonmatchingPrefixIsAnEmptyCollection
	|sentenceFinder result|
	sentenceFinder  := SentenceFinderByPrefix  new.
	sentenceFinder push: 'winter is coming'.
	sentenceFinder push: 'winning is everything'.
	sentenceFinder push: 'The winds of Winter'.
	sentenceFinder push: 'Winter is here'.  

	result:= sentenceFinder find: 'xx'.
	result isKindOf: Collection.
	result isEmpty.
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'dhs 4/21/2019 18:52:31'!
initialize
	top := OOStackElementEmpty  new
! !


!OOStack methodsFor: 'testing' stamp: 'dhs 4/21/2019 18:52:52'!
isEmpty
	^ top emptyElement! !


!OOStack methodsFor: 'accessing' stamp: 'dhs 4/21/2019 18:56:36'!
pop
	|previousTop|
	top ensureNotEmpty.
	previousTop := top. 
	top:= top previous.
	^ previousTop value! !

!OOStack methodsFor: 'accessing' stamp: 'dhs 4/21/2019 18:54:07'!
push: anObject 
	top:= OOStackElementWithValue with:  anObject andPrevious: top! !

!OOStack methodsFor: 'accessing' stamp: 'dhs 4/21/2019 19:02:05'!
size
	^top size ! !

!OOStack methodsFor: 'accessing' stamp: 'dhs 4/21/2019 18:59:36'!
top
	top ensureNotEmpty.
	^ top value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
OOStack subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'dhs 4/21/2019 20:13:59'!
find: prefixToSearch
	|tempStack matchesFound|
	prefixToSearch isEmpty ifTrue: [self error: self class cannotLookUpEmptyPrefix]. 
	(prefixToSearch includes: $ ) ifTrue: [self error: self class cannotLookUpPrefixWithSpaces ].
	
	matchesFound:= OrderedCollection new.
	tempStack := self class new.
	
	[self isEmpty] whileFalse: [ 
		tempStack push: (self pop).
		(tempStack top beginsWith: prefixToSearch) ifTrue: [
			matchesFound add: tempStack top.
		]
	].

	[tempStack isEmpty] whileFalse: [
		self push: (tempStack pop)
	].

	^matchesFound
	
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 19:46:23'!
cannotLookUpEmptyPrefix
	^ 'No se puede buscar un prefijo vacío'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'dhs 4/21/2019 19:47:22'!
cannotLookUpPrefixWithSpaces
	^ 'No se puede buscar un prefijo con espacios'! !


!classDefinition: #OOStackElement category: #'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: 'elements nextPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'testing' stamp: 'dhs 4/21/2019 19:12:31'!
emptyElement
	self subclassResponsibility ! !

!OOStackElement methodsFor: 'testing' stamp: 'dhs 4/21/2019 19:12:40'!
ensureNotEmpty
	self subclassResponsibility ! !


!OOStackElement methodsFor: 'accessing' stamp: 'dhs 4/21/2019 19:12:52'!
size
	self subclassResponsibility ! !


!classDefinition: #OOStackElementEmpty category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackElementEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElementEmpty methodsFor: 'testing' stamp: 'dhs 4/15/2019 21:50:42'!
emptyElement
	^true! !

!OOStackElementEmpty methodsFor: 'testing' stamp: 'dhs 4/21/2019 19:08:49'!
ensureNotEmpty
	self error: OOStack stackEmptyErrorDescription .! !


!OOStackElementEmpty methodsFor: 'accessing' stamp: 'dhs 4/21/2019 19:01:56'!
size
	^0! !


!classDefinition: #OOStackElementWithValue category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackElementWithValue
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElementWithValue methodsFor: 'private' stamp: 'dhs 4/21/2019 18:51:26'!
previous
	^previous! !


!OOStackElementWithValue methodsFor: 'testing' stamp: 'dhs 4/15/2019 21:50:54'!
emptyElement
	^false! !

!OOStackElementWithValue methodsFor: 'testing' stamp: 'dhs 4/15/2019 21:55:42'!
ensureNotEmpty! !


!OOStackElementWithValue methodsFor: 'accessing' stamp: 'dhs 4/21/2019 19:01:43'!
size
	^1 + previous size! !

!OOStackElementWithValue methodsFor: 'accessing' stamp: 'dhs 4/15/2019 21:54:12'!
value
	^value! !


!OOStackElementWithValue methodsFor: 'initialization' stamp: 'dhs 4/21/2019 18:49:47'!
initializeWith: aValue andTop: previousTop
	value := aValue.
	previous := previousTop.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackElementWithValue class' category: #'Stack-Exercise'!
OOStackElementWithValue class
	instanceVariableNames: ''!

!OOStackElementWithValue class methodsFor: 'instance creation' stamp: 'dhs 4/21/2019 18:48:53'!
with: value andPrevious: previousStackTop
	^self basicNew initializeWith: value andTop: previousStackTop! !
