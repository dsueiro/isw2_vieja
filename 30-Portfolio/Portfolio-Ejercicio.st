!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:44:23'!
testBalanceAndTransactionsSumOfTransactionsAccountsAndPortfolio
	| account1 deposit1 portfolio1 account2 portfolio2 |
	
	account1 _ ReceptiveAccount new.
	deposit1 _ Deposit register: 100 on: account1.
	portfolio1 _ Portfolio new.
	account1 registerOn: portfolio1.
	
	account2 _ ReceptiveAccount new.
	Deposit register: 200 on: account2.
	portfolio2 _ Portfolio new.
	portfolio1 registerOn: portfolio2.
	account2 registerOn: portfolio2.
	
	self assert: 300 equals: portfolio2 balance .
	self assert: (portfolio2 transactions includes: deposit1).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:45:21'!
testCantAddAPortfolioTwice
	| portfolio1 portfolio2 |
	
	portfolio1 _ Portfolio new.
	
	portfolio2 _ Portfolio new.
	portfolio1 registerOn: portfolio2.
	
	
	self 
		should: [ portfolio1 registerOn: portfolio2. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Portfolio cantAddAPortfolioTwiceErrorDescription.
		].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:44:49'!
testCantAddAnAccountTwice
	| account1 portfolio |
	
	account1 _ ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	portfolio _ Portfolio new.
	account1 registerOn: portfolio.
	
	
	self 
		should: [ account1 registerOn: portfolio. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Portfolio cantAddAnAccountTwiceErrorDescription.
		].! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:42:55'!
testPortfolioHaveSumOfAccountBalance
	| account1 account2 portfolio |
	account1 _ ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	account2 _ ReceptiveAccount new.
	Deposit register: 200 on: account2.

	portfolio _ Portfolio new.
	account1 registerOn: portfolio.
	account2 registerOn: portfolio.
	
	self assert: 300 equals: portfolio balance .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:43:07'!
testPortfolioKnowsItsTransactions 

	| portfolio account1 account2 deposit withdraw transactions|
	
	account1 _ ReceptiveAccount new.
	deposit _ Deposit register: 100 on: account1.
	
	account2 _ ReceptiveAccount new.
	withdraw _ Withdraw register: 200 on: account2.
	
	portfolio _ Portfolio new.
	account1 registerOn: portfolio.
	account2 registerOn: portfolio.
	
	transactions _ portfolio transactions.
	self assert: 2 equals: transactions size.
	self assert: (portfolio transactions includes: deposit).
	self assert: (portfolio transactions includes: withdraw).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:43:00'!
testPortfolioKnowsRegisteredTransactions

	| portfolio account1 account2 deposit withdraw |
	
	account1 _ ReceptiveAccount new.
	deposit _ Deposit register: 100 on: account1.
	
	account2 _ ReceptiveAccount new.
	withdraw _ Withdraw register: 200 on: account2.

	portfolio _ Portfolio new.
	account1 registerOn: portfolio.
	account2 registerOn: portfolio.
	
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'GSC 5/23/2019 20:50:56'!
affectBalance: aBalance
	^ aBalance + self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'GSC 5/23/2019 20:50:29'!
affectBalance: aBalance
	^ aBalance - self value.! !

!Withdraw methodsFor: 'value' stamp: 'GSC 5/23/2019 20:26:52'!
value
	^ value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioEntry category: #'Portfolio-Ejercicio'!
Object subclass: #PortfolioEntry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioEntry methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 01:55:02'!
addToPorfolioAccounts: porfolioAccounts
	^ self subclassResponsibility.! !

!PortfolioEntry methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 01:02:01'!
registerOn: aPortfolio 
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
PortfolioEntry subclass: #Portfolio
	instanceVariableNames: 'porfolioEntries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 01:49:28'!
accounts
	^ porfolioEntries 
		inject: Set new 
		into: [:porfolioAccounts :porfolioEntry | porfolioEntry addToPorfolioAccounts: porfolioAccounts].
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 01:54:44'!
addToPorfolioAccounts: porfolioAccounts
	^ self accounts.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 01:52:39'!
balance
	^ self accounts sum: [: account | account balance]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 00:21:46'!
hasRegistered: aTransaction
	^ porfolioEntries anySatisfy: [:account | account hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 00:45:55'!
initialize
	porfolioEntries _ OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:41:32'!
portfolioEntries
	^ porfolioEntries! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:41:53'!
registerOn: aPortfolio 
	(aPortfolio portfolioEntries includes: self) ifTrue: [self error: aPortfolio class cantAddAPortfolioTwiceErrorDescription].
	aPortfolio portfolioEntries add: self.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'GSC 5/24/2019 00:20:45'!
transactions
	^ porfolioEntries 
		inject: OrderedCollection new 
		into: [:transactions :account | transactions addAll: account transactions; yourself].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:37:53'!
cantAddAPortfolioTwiceErrorDescription
	^ 'Cannot add a portfoli twice to a Portfolio'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:34:13'!
cantAddAnAccountTwiceErrorDescription
	^ 'Cannot add an account twice to a Portfolio'.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
PortfolioEntry subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'GSC 5/24/2019 00:42:40'!
initialize
	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'GSC 5/24/2019 01:52:01'!
addToPorfolioAccounts: porfolioAccounts
	^ porfolioAccounts add: self; yourself.! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'GSC 5/24/2019 00:42:45'!
register: aTransaction
	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'GSC 5/24/2019 00:42:50'!
transactions 
	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'GSC 5/23/2019 20:47:50'!
balance
	^transactions 
		inject: 0
		into: [ :currentBalance :aTransaction | aTransaction affectBalance: currentBalance ].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'GSC 5/24/2019 00:42:30'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'GSC 5/26/2019 21:41:32'!
registerOn: aPortfolio 
	(aPortfolio portfolioEntries includes: self) ifTrue: [self error: aPortfolio class cantAddAnAccountTwiceErrorDescription].
	aPortfolio portfolioEntries add: self.! !

