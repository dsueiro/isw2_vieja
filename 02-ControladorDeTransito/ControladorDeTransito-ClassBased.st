!classDefinition: #ControladorDeTransito category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #ControladorDeTransito
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ControladorDeTransito class' category: #'ControladorDeTransito-ClassBased'!
ControladorDeTransito class
	instanceVariableNames: 'semaforoDeCorrientes semaforoDeScalabriniOrtiz intervaloSeñalEnSegundos'!

!ControladorDeTransito class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:56:58'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:25:11'!
activarInicioAlternadoDeTransito
	2 timesRepeat: [
		self apagar.
		self avisarAvanceSemaforoDeCorrientes .
		self avisarAvanceSemaforoDeScalabriniOrtiz.
	].
	! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:17:24'!
apagar
	semaforoDeCorrientes apagar.
	semaforoDeScalabriniOrtiz apagar.! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:33:30'!
avisarAvanceSemaforoDeCorrientes
	semaforoDeScalabriniOrtiz avisarDetencion.
	semaforoDeCorrientes avisarAvance.
	(Delay for: intervaloSeñalEnSegundos*second) wait.
	semaforoDeScalabriniOrtiz avisarPrecaucion .
	semaforoDeCorrientes avisarPrecaucion.
	(Delay for: intervaloSeñalEnSegundos*second) wait.
! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:20:07'!
avisarAvanceSemaforoDeScalabriniOrtiz
	semaforoDeCorrientes avisarDetencion.
	semaforoDeScalabriniOrtiz avisarAvance.
	(Delay for: intervaloSeñalEnSegundos*second) wait.
	semaforoDeCorrientes avisarPrecaucion.
	semaforoDeScalabriniOrtiz avisarPrecaucion.
	(Delay for: intervaloSeñalEnSegundos*second) wait.
! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:25:52'!
avisarPrecaucionPorEncendido
	5 timesRepeat: [ 
		self titilarSeñalDePrecaucion.
		]! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:49:03'!
iniciar
	self 
		avisarPrecaucionPorEncendido;
		activarInicioAlternadoDeTransito.
	
	! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:35:50'!
prender
	semaforoDeCorrientes prender.
	semaforoDeScalabriniOrtiz prender.! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:27:42'!
titilarSeñalDePrecaucion
	semaforoDeCorrientes avisarPrecaucion.
	semaforoDeScalabriniOrtiz avisarPrecaucion.
	(Delay for: intervaloSeñalEnSegundos*second) wait.
	semaforoDeCorrientes apagar.
	semaforoDeScalabriniOrtiz apagar.
	(Delay for: intervaloSeñalEnSegundos*second) wait.! !


!ControladorDeTransito class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	semaforoDeCorrientes := SemaforoDeCorrientes.
	semaforoDeScalabriniOrtiz := SemaforoDeScalabriniOrtiz.
	intervaloSeñalEnSegundos := 2.! !


!classDefinition: #Semaforo category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #Semaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Semaforo class' category: #'ControladorDeTransito-ClassBased'!
Semaforo class
	instanceVariableNames: 'señalDeDetencion señalDePrecaucion señalDeAvance tiempoDeCadaSeñal'!

!Semaforo class methodsFor: 'morph' stamp: 'GSC 4/1/2019 20:47:25'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!Semaforo class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:47:25'!
apagar
	señalDeDetencion apagar.
	señalDePrecaucion apagar.
	señalDeAvance apagar.! !

!Semaforo class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:47:25'!
avisarAvance
	señalDePrecaucion apagar.
	señalDeAvance prender.
	! !

!Semaforo class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:47:25'!
avisarDetencion
	señalDePrecaucion apagar.
	señalDeDetencion prender.
	! !

!Semaforo class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:47:25'!
avisarPrecaucion
	señalDeAvance apagar.
	señalDeDetencion apagar.
	señalDePrecaucion prender.
	! !

!Semaforo class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:47:25'!
permitirAvanzar
	self 
		apagar;
		avisarAvance.! !

!Semaforo class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:54:21'!
prender
	self 
		openInWorld;
		apagar.! !


!Semaforo class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeCorrientes.
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes.
	señalDeAvance := SeñalDeAvanceDeCorrientes.
	tiempoDeCadaSeñal := 1.! !


!classDefinition: #SemaforoDeCorrientes category: #'ControladorDeTransito-ClassBased'!
Semaforo subclass: #SemaforoDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeCorrientes class' category: #'ControladorDeTransito-ClassBased'!
SemaforoDeCorrientes class
	instanceVariableNames: 'señalDeDetencion señalDePrecaucion señalDeAvance tiempoDeCadaSeñal'!

!SemaforoDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:54:51'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!SemaforoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeCorrientes.
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes.
	señalDeAvance := SeñalDeAvanceDeCorrientes.
	tiempoDeCadaSeñal := 1.
	señalDeDetencion := SeñalDeDetencionDeCorrientes.
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes.
	señalDeAvance := SeñalDeAvanceDeCorrientes.
	tiempoDeCadaSeñal := 1.! !


!classDefinition: #SemaforoDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
Semaforo subclass: #SemaforoDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeScalabriniOrtiz class' category: #'ControladorDeTransito-ClassBased'!
SemaforoDeScalabriniOrtiz class
	instanceVariableNames: 'señalDeDetencion señalDePrecaucion señalDeAvance tiempoDeCadaSeñal'!

!SemaforoDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:59:33'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!SemaforoDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeScalabriniOrtiz.
	señalDePrecaucion := SeñalDePrecaucionDeScalabriniOrtiz.
	señalDeAvance := SeñalDeAvanceDeScalabriniOrtiz.
	tiempoDeCadaSeñal := 1.
	señalDeDetencion := SeñalDeDetencionDeScalabriniOrtiz.
	señalDePrecaucion := SeñalDePrecaucionDeScalabriniOrtiz.
	señalDeAvance := SeñalDeAvanceDeScalabriniOrtiz.
	tiempoDeCadaSeñal := 1.! !


!classDefinition: #SeñalDeAvance category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvance class' category: #'ControladorDeTransito-ClassBased'!
SeñalDeAvance class
	instanceVariableNames: ''!

!SeñalDeAvance class methodsFor: 'morph' stamp: 'GSC 4/1/2019 20:55:28'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeAvance class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:55:28'!
apagar
	self color: Color black.! !

!SeñalDeAvance class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:55:28'!
prender
	self color: Color green.! !


!SeñalDeAvance class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceDeCorrientes category: #'ControladorDeTransito-ClassBased'!
SeñalDeAvance subclass: #SeñalDeAvanceDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeCorrientes class' category: #'ControladorDeTransito-ClassBased'!
SeñalDeAvanceDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeAvanceDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:55:01'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
SeñalDeAvance subclass: #SeñalDeAvanceDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeScalabriniOrtiz class' category: #'ControladorDeTransito-ClassBased'!
SeñalDeAvanceDeScalabriniOrtiz class
	instanceVariableNames: ''!

!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:56:28'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencion category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeDetencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencion class' category: #'ControladorDeTransito-ClassBased'!
SeñalDeDetencion class
	instanceVariableNames: ''!

!SeñalDeDetencion class methodsFor: 'morph' stamp: 'GSC 4/1/2019 20:57:48'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeDetencion class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:57:48'!
apagar
	self color: Color black.! !

!SeñalDeDetencion class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:57:48'!
prender
	self color: Color red.! !


!SeñalDeDetencion class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeCorrientes category: #'ControladorDeTransito-ClassBased'!
SeñalDeDetencion subclass: #SeñalDeDetencionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeCorrientes class' category: #'ControladorDeTransito-ClassBased'!
SeñalDeDetencionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeDetencionDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:55:11'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeDetencionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
SeñalDeDetencion subclass: #SeñalDeDetencionDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeScalabriniOrtiz class' category: #'ControladorDeTransito-ClassBased'!
SeñalDeDetencionDeScalabriniOrtiz class
	instanceVariableNames: ''!

!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:57:58'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucion category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucion class' category: #'ControladorDeTransito-ClassBased'!
SeñalDePrecaucion class
	instanceVariableNames: ''!

!SeñalDePrecaucion class methodsFor: 'morph' stamp: 'GSC 4/1/2019 20:58:47'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDePrecaucion class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:58:47'!
apagar
	self color: Color black.! !

!SeñalDePrecaucion class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:58:47'!
prender
	self color: Color yellow.! !


!SeñalDePrecaucion class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeCorrientes category: #'ControladorDeTransito-ClassBased'!
SeñalDePrecaucion subclass: #SeñalDePrecaucionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeCorrientes class' category: #'ControladorDeTransito-ClassBased'!
SeñalDePrecaucionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:55:18'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
SeñalDePrecaucion subclass: #SeñalDePrecaucionDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ControladorDeTransito-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeScalabriniOrtiz class' category: #'ControladorDeTransito-ClassBased'!
SeñalDePrecaucionDeScalabriniOrtiz class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:57:48'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 21:02:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

ControladorDeTransito initializeAfterFileIn!
Semaforo initializeAfterFileIn!
SemaforoDeCorrientes initializeAfterFileIn!
SemaforoDeScalabriniOrtiz initializeAfterFileIn!
SeñalDeAvance initializeAfterFileIn!
SeñalDeAvanceDeCorrientes initializeAfterFileIn!
SeñalDeAvanceDeScalabriniOrtiz initializeAfterFileIn!
SeñalDeDetencion initializeAfterFileIn!
SeñalDeDetencionDeCorrientes initializeAfterFileIn!
SeñalDeDetencionDeScalabriniOrtiz initializeAfterFileIn!
SeñalDePrecaucion initializeAfterFileIn!
SeñalDePrecaucionDeCorrientes initializeAfterFileIn!
SeñalDePrecaucionDeScalabriniOrtiz initializeAfterFileIn!