!classDefinition: #PortfolioTest category: #PortfolioTreePrinter!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:15'!
test08PortfolioTransasctionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #PortfolioTreePrinter!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

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


!classDefinition: #ReportTest category: #PortfolioTreePrinter!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!ReportTest methodsFor: 'tests' stamp: 'DHS 6/3/2019 01:04:55'!
test01AccountSummaryCanReportOnEmptyAccount
	| account report expected |
	account := ReceptiveAccount  new.
	
	report := AccountSummary for: account.
	
	expected := OrderedCollection with: 'Balance = 0'. 
	self assert: report show equals: expected
	! !

!ReportTest methodsFor: 'tests' stamp: 'DHS 6/3/2019 01:05:24'!
test02AccountSummaryCanReportDeposits
	| account report deposit expected portfolio |
	account := ReceptiveAccount  new.
	
	portfolio := Portfolio with: account.
	
	deposit := Deposit for: 100.
	account register: deposit.
	
	report := AccountSummary for: portfolio.
	
	expected := OrderedCollection with:  'Depósito por 100.' with: 'Balance = 100'.
	self assert: report show equals:  expected.
	! !

!ReportTest methodsFor: 'tests' stamp: 'DHS 6/3/2019 01:05:50'!
test03AccountSummaryCanReportWithdraws
	| account report deposit expected portfolio withdraw |
	account := ReceptiveAccount  new.
	
	portfolio := Portfolio with: account.
	
	deposit := Deposit for: 100.
	account register: deposit.
	
	withdraw := Withdraw for: 50.
	account register: withdraw.
	
	report := AccountSummary for: portfolio.
	
	expected := OrderedCollection withAll: #(
		 'Depósito por 100.'
		 'Extracción por 50.'
		 'Balance = 50'
		).
		
	self assert: report show equals:  expected.
	! !

!ReportTest methodsFor: 'tests' stamp: 'DHS 6/3/2019 01:06:25'!
test04AccountSummaryCanReportWithdrawForTransfer
	| account report deposit expected portfolio withdraw anotherAccount |
	account := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: account.
	
	report := AccountSummary for: portfolio.
	
	deposit := Deposit for: 100.
	account register: deposit.
	
	withdraw := Withdraw for: 50.
	account register: withdraw.
	
	Transfer from: account to: anotherAccount for: 20.
	
	expected := OrderedCollection withAll: #(
		 'Depósito por 100.'
		 'Extracción por 50.'
		 'Salida por transferencia de 20.'
		 'Balance = 30' 
		).
		
	self assert: report show equals:  expected.
	! !

!ReportTest methodsFor: 'tests' stamp: 'DHS 6/3/2019 01:06:47'!
test05AccountSummaryCanReportDepositForTransfer
	| account report deposit expected portfolio withdraw anotherAccount |
	account := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: account.
	
	report := AccountSummary for: portfolio.
	
	deposit := Deposit for: 100.
	account register: deposit.
	
	withdraw := Withdraw for: 50.
	account register: withdraw.
	
	Transfer from: account to: anotherAccount for: 20.
	Transfer from: anotherAccount to: account for: 30.
		
	expected := OrderedCollection withAll: #(
		 'Depósito por 100.'
		 'Extracción por 50.'
		 'Salida por transferencia de 20.'
		 'Entrada por transferencia de 30.'
		 'Balance = 60' 
		).
		
	self assert: report show equals:  expected.
	! !

!ReportTest methodsFor: 'tests' stamp: 'DHS 6/3/2019 01:07:36'!
test06NetTransferCanCalculateBalanceFromTransfers
	| account report deposit portfolio withdraw anotherAccount |
	account := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: account.
	
	report := TransferNet for: portfolio.
	
	deposit := Deposit for: 100.
	account register: deposit.
	
	withdraw := Withdraw for: 50.
	account register: withdraw.
	
	Transfer from: account to: anotherAccount for: 20.
	Transfer from: anotherAccount to: account for: 30.
		
	self assert: report show equals: 10.
	! !


!classDefinition: #TransferTest category: #PortfolioTreePrinter!
TestCase subclass: #TransferTest
	instanceVariableNames: 'withdrawAccount depositAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!TransferTest methodsFor: 'tests' stamp: 'DHS 6/2/2019 19:31:27'!
test01TransferIncreasesBalanceOnTransactionValueToReceivingAccount
	Transfer from: withdrawAccount to: depositAccount for: 50.	
		
	self assert: 50 equals: depositAccount balance .
	! !

!TransferTest methodsFor: 'tests' stamp: 'DHS 6/2/2019 19:31:46'!
test02TransferIncreasesBalanceOnTransactionValueToReceivingAccount
	Transfer from: withdrawAccount to: depositAccount for: 50.	
		
	self assert: -50 equals: withdrawAccount balance .
	! !

!TransferTest methodsFor: 'tests' stamp: 'DHS 6/2/2019 19:31:54'!
test03WithdrawAccountTransactionIncludesWithdrawLegOfTransfer
	| transfer |

	transfer := Transfer from: withdrawAccount to: depositAccount for: 50.	
		
	self assert: (withdrawAccount transactions includes: transfer withdrawLeg).
	! !

!TransferTest methodsFor: 'tests' stamp: 'DHS 6/2/2019 19:30:42'!
test04DepositAccountTransactionIncludesDepositLegOfTransfer
	| transfer |

	transfer := Transfer from: withdrawAccount to: depositAccount for: 50.	
		
	self assert: (depositAccount transactions includes: transfer depositLeg).
	! !


!TransferTest methodsFor: 'setUp/tearDown' stamp: 'DHS 6/2/2019 19:31:34'!
setUp
	withdrawAccount := ReceptiveAccount new.
	depositAccount := ReceptiveAccount new.

	! !


!classDefinition: #Account category: #PortfolioTreePrinter!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #PortfolioTreePrinter!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #PortfolioTreePrinter!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #PortfolioTreePrinter!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountReport category: #PortfolioTreePrinter!
Object subclass: #AccountReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountReport methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:21:53'!
reportForDeposit: aDeposit on: lines
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:22:00'!
reportForDepositForTransfer: aDepositForTransfer on: lines
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:22:06'!
reportForWithdraw: aWithdraw on: lines
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:22:12'!
reportForWithdrawForTransfer: aWithdrawForTransfer on: lines
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:44:22'!
visitTransaction
	| reportedValues |
	reportedValues := OrderedCollection new.

	account transactions do: [
			:transaction | transaction acceptReportVisitor: self on: reportedValues ].			
	^ reportedValues.! !


!AccountReport methodsFor: 'initialization' stamp: 'DHS 6/3/2019 01:33:11'!
initializeFor: anAccount 
	account := anAccount ! !


!AccountReport methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:10:04'!
show
	self subclassResponsibility ! !


!classDefinition: #AccountSummary category: #PortfolioTreePrinter!
AccountReport subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountSummary methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:18:58'!
reportForDeposit: aDeposit on: lines
	lines add: 'Depósito por ', aDeposit value  asString, '.'
! !

!AccountSummary methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:19:14'!
reportForDepositForTransfer: aDepositForTransfer on: lines
	lines add:  'Entrada por transferencia de ', aDepositForTransfer value  asString, '.' 
! !

!AccountSummary methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:19:38'!
reportForWithdraw: aWithdraw on: lines
	lines add: 'Extracción por ', aWithdraw value  asString, '.' 
! !

!AccountSummary methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:20:00'!
reportForWithdrawForTransfer: aWithdrawForTransfer on: lines
	lines add: 'Salida por transferencia de ', aWithdrawForTransfer value  asString, '.' 
! !


!AccountSummary methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:44:22'!
show
	| lines |
	lines := self visitTransaction.

	lines add: 'Balance = ', account balance asString .
	^ lines.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #PortfolioTreePrinter!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'DHS 6/3/2019 00:02:17'!
for: anAccount 
	^self new initializeFor: anAccount! !

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'DHS 6/2/2019 23:54:07'!
show
	^ OrderedCollection new! !


!classDefinition: #TransferNet category: #PortfolioTreePrinter!
AccountReport subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!TransferNet methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:26:31'!
reportForDeposit: aDeposit on: values
! !

!TransferNet methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:26:03'!
reportForDepositForTransfer: aDepositForTransfer on: values
	values add: aDepositForTransfer value 
! !

!TransferNet methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:26:47'!
reportForWithdraw: aWithdraw on: values
! !

!TransferNet methodsFor: 'visitor' stamp: 'DHS 6/3/2019 01:25:17'!
reportForWithdrawForTransfer: aWithdrawForTransfer on: values
	values add: aWithdrawForTransfer value negated 
! !


!TransferNet methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:44:22'!
show
	| values |
	values := self visitTransaction.

	^ values sum.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: #PortfolioTreePrinter!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'DHS 6/3/2019 00:35:52'!
for: anAccount 
	^self new initializeFor: anAccount! !

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'DHS 6/3/2019 00:35:52'!
show
	^ OrderedCollection new! !


!classDefinition: #AccountTransaction category: #PortfolioTreePrinter!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:17:03'!
acceptReportVisitor: aReport on: result
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #PortfolioTreePrinter!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #DepositTransaction category: #PortfolioTreePrinter!
AccountTransaction subclass: #DepositTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!DepositTransaction methodsFor: 'balance' stamp: 'DHS 6/2/2019 20:17:48'!
affectBalance: aBalance

	^aBalance + self value ! !


!classDefinition: #Deposit category: #PortfolioTreePrinter!
DepositTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:16:41'!
acceptReportVisitor: aReport on: result
	^ aReport reportForDeposit: self on: result! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #PortfolioTreePrinter!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositForTransfer category: #PortfolioTreePrinter!
DepositTransaction subclass: #DepositForTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!DepositForTransfer methodsFor: 'initialization' stamp: 'DHS 6/2/2019 21:14:54'!
initializeLegOf: aTransfer 
	transfer := aTransfer! !


!DepositForTransfer methodsFor: 'value' stamp: 'DHS 6/2/2019 21:13:26'!
value
	^ transfer amount! !


!DepositForTransfer methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:17:27'!
acceptReportVisitor: aReport on: result
	^ aReport reportForDepositForTransfer: self on: result! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositForTransfer class' category: #PortfolioTreePrinter!
DepositForTransfer class
	instanceVariableNames: ''!

!DepositForTransfer class methodsFor: 'instance creation' stamp: 'DHS 6/2/2019 21:14:25'!
legOf: aTransfer

	^ self new initializeLegOf: aTransfer ! !


!classDefinition: #WithdrawTransaction category: #PortfolioTreePrinter!
AccountTransaction subclass: #WithdrawTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!WithdrawTransaction methodsFor: 'balance' stamp: 'DHS 6/2/2019 20:23:26'!
affectBalance: aBalance

	^aBalance - self value ! !


!classDefinition: #Withdraw category: #PortfolioTreePrinter!
WithdrawTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:17:51'!
acceptReportVisitor: aReport on: result
	^ aReport reportForWithdraw: self on: result! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #PortfolioTreePrinter!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawForTransfer category: #PortfolioTreePrinter!
WithdrawTransaction subclass: #WithdrawForTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!WithdrawForTransfer methodsFor: 'initialization' stamp: 'DHS 6/2/2019 21:17:12'!
initializeLegOf: aTransfer 
	transfer := aTransfer 
	! !


!WithdrawForTransfer methodsFor: 'value' stamp: 'DHS 6/2/2019 20:25:57'!
value
	^ transfer amount! !


!WithdrawForTransfer methodsFor: 'reporting' stamp: 'DHS 6/3/2019 01:18:12'!
acceptReportVisitor: aReport on: result
	^ aReport reportForWithdrawForTransfer: self on: result! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawForTransfer class' category: #PortfolioTreePrinter!
WithdrawForTransfer class
	instanceVariableNames: ''!


!WithdrawForTransfer class methodsFor: 'as yet unclassified' stamp: 'DHS 6/2/2019 21:16:40'!
legOf: aTransfer 
	^self new initializeLegOf: aTransfer! !


!classDefinition: #Transfer category: #PortfolioTreePrinter!
Object subclass: #Transfer
	instanceVariableNames: 'withdraw deposit amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'DHS 6/2/2019 20:25:54'!
amount
	^amount! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'DHS 6/3/2019 00:26:54'!
initializeFrom: withdrawAccount to: depositAccount for: anAmount 
	amount := anAmount.
	
	withdraw := WithdrawForTransfer legOf: self.
	withdrawAccount register: withdraw.
		
	deposit := DepositForTransfer legOf: self.
	depositAccount register: deposit.
! !


!Transfer methodsFor: 'accessing' stamp: 'DHS 6/2/2019 19:23:29'!
depositLeg
	^deposit! !

!Transfer methodsFor: 'accessing' stamp: 'DHS 6/2/2019 19:17:01'!
withdrawLeg
	^withdraw ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #PortfolioTreePrinter!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'DHS 6/2/2019 20:24:48'!
from: extractionAccount to: depositAccount for: anAmount 
	^self new initializeFrom: extractionAccount to: depositAccount for: anAmount.! !
