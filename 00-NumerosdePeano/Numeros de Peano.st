!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:34:08'!
* unNumeroDePeano
	^ unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:29:25'!
+ unNumeroDePeano
	^ unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:42:46'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^self].
	self error: 'El uno no se puede dividir por un numero diferente a si mismo'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'GSC 4/3/2019 20:45:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !

!I class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 17:44:37'!
next
	^ next! !

!I class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:25:03'!
substractMeFrom: unNumeroPeano
	^unNumeroPeano previous.! !


!classDefinition: #II category: #'Numeros de Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: 'previous next'!

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:39:55'!
* unNumeroDePeano
	unNumeroDePeano = I ifTrue: [^self].
	^ self * unNumeroDePeano previous + self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:26:28'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:30:30'!
- unNumeroDePeano
	^unNumeroDePeano substractMeFrom: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:53:13'!
/ unNumeroDePeano
	|denominador numerador resto|
	
	denominador _ unNumeroDePeano.
	numerador _ self.
	resto _ numerador - denominador 
	
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 4/3/2019 20:45:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := I.
	next := III.! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:23:01'!
next
	next ifNil: 
	[
		next _ self cloneNamed: self name, 'I'.
		next previous: self.
	].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:22:41'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:23:48'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 18:06:58'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:26:35'!
substractMeFrom: unNumeroPeano
	^self previous substractMeFrom: unNumeroPeano previous.! !


!classDefinition: #III category: #'Numeros de Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros de Peano'!
III class
	instanceVariableNames: 'previous next'!

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:29:51'!
* unNumeroDePeano
	unNumeroDePeano = I ifTrue: [^self].
	^ self * unNumeroDePeano previous + self.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:29:51'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:00'!
- unNumeroDePeano
	^unNumeroDePeano substractMeFrom: self! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 4/3/2019 20:45:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := II.
	next := IIII.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:29:51'!
next
	next ifNil: 
	[
		next _ self cloneNamed: self name, 'I'.
		next previous: self.
	].
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:29:51'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:29:51'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:29:51'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:29:51'!
substractMeFrom: unNumeroPeano
	^self previous substractMeFrom: unNumeroPeano previous.! !


!classDefinition: #IIII category: #'Numeros de Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros de Peano'!
IIII class
	instanceVariableNames: 'previous next'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
* unNumeroDePeano
	unNumeroDePeano = I ifTrue: [^self].
	^ self * unNumeroDePeano previous + self.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
- unNumeroDePeano
	^unNumeroDePeano substractMeFrom: self! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 4/3/2019 20:45:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := III.
	next := nil.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
next
	next ifNil: 
	[
		next _ self cloneNamed: self name, 'I'.
		next previous: self.
	].
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GSC 3/28/2019 19:31:30'!
substractMeFrom: unNumeroPeano
	^self previous substractMeFrom: unNumeroPeano previous.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!