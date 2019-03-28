!classDefinition: #ControladorDeTransito category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #ControladorDeTransito
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ControladorDeTransito class' category: #'Semaforo-ClassBased'!
ControladorDeTransito class
	instanceVariableNames: 'semaforoDeCorrientes semaforoDeScalabriniOrtiz'!

!ControladorDeTransito class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:56:58'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 3/26/2019 02:00:01'!
activarInicioAlternadoDeTransito
	2 timesRepeat: [
		semaforoDeScalabriniOrtiz avisarDetencion.
		semaforoDeCorrientes avisarAvance.
		semaforoDeCorrientes avisarDetencion.
		semaforoDeScalabriniOrtiz avisarAvance.
	].
	! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:17:24'!
apagar
	semaforoDeCorrientes apagar.
	semaforoDeScalabriniOrtiz apagar.! !

!ControladorDeTransito class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:40:40'!
avisarPrecaucionPorEncendido
	self 
		apagar;
		prender.
	! !

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


!ControladorDeTransito class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	semaforoDeCorrientes := SemaforoDeCorrientes.
	semaforoDeScalabriniOrtiz := SemaforoDeScalabriniOrtiz.! !


!classDefinition: #SemaforoDeCorrientes category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SemaforoDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeCorrientes class' category: #'Semaforo-ClassBased'!
SemaforoDeCorrientes class
	instanceVariableNames: 'señalDeDetencion señalDePrecaucion señalDeAvance tiempoDeCadaSeñal'!

!SemaforoDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:54:51'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:13:16'!
apagar
	señalDeDetencion apagar.
	señalDePrecaucion apagar.
	señalDeAvance apagar.! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:56:13'!
avisarAvance
	señalDeDetencion apagar.
	señalDePrecaucion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	señalDePrecaucion apagar.
	señalDeAvance prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	
	! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:56:22'!
avisarDetencion
	señalDeAvance apagar.
	señalDePrecaucion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	señalDePrecaucion apagar.
	señalDeDetencion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	
	! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:14:30'!
avisarPrecaucionPorEncendido
	5 timesRepeat: [ self titilarSeñalDePrecaucion. ]! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:22:42'!
permitirAvanzar
	self 
		apagar;
		avisarAvance.! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:54:51'!
prender
	self 
		openInWorld;
		apagar;
		avisarPrecaucionPorEncendido.! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:56:34'!
titilarSeñalDePrecaucion
	señalDePrecaucion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	señalDePrecaucion apagar.
	(Delay for: tiempoDeCadaSeñal*second) wait.! !


!SemaforoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeCorrientes.
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes.
	señalDeAvance := SeñalDeAvanceDeCorrientes.
	tiempoDeCadaSeñal := 1.! !


!classDefinition: #SemaforoDeScalabriniOrtiz category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SemaforoDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeScalabriniOrtiz class' category: #'Semaforo-ClassBased'!
SemaforoDeScalabriniOrtiz class
	instanceVariableNames: 'señalDeDetencion señalDePrecaucion señalDeAvance tiempoDeCadaSeñal'!

!SemaforoDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:59:33'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:14:04'!
apagar
	señalDeDetencion apagar.
	señalDePrecaucion apagar.
	señalDeAvance apagar.! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:56:45'!
avisarAvance
	señalDeDetencion apagar.
	señalDePrecaucion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	señalDePrecaucion apagar.
	señalDeAvance prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	
	! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:56:52'!
avisarDetencion
	señalDeAvance apagar.
	señalDePrecaucion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	señalDePrecaucion apagar.
	señalDeDetencion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	
	! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:52:03'!
avisarPrecaucionPorEncendido
	5 timesRepeat: [ 
		self titilarSeñalDePrecaucion.
		]! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:52:03'!
prender
	self 
		openInWorld;
		apagar;
		avisarPrecaucionPorEncendido.! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:57:00'!
titilarSeñalDePrecaucion
	señalDePrecaucion prender.
	(Delay for: tiempoDeCadaSeñal*second) wait.
	señalDePrecaucion apagar.
	(Delay for: tiempoDeCadaSeñal*second) wait.! !


!SemaforoDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeScalabriniOrtiz.
	señalDePrecaucion := SeñalDePrecaucionDeScalabriniOrtiz.
	señalDeAvance := SeñalDeAvanceDeScalabriniOrtiz.
	tiempoDeCadaSeñal := 1.! !


!classDefinition: #SeñalDeAvanceDeCorrientes category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeAvanceDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeCorrientes class' category: #'Semaforo-ClassBased'!
SeñalDeAvanceDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeAvanceDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:55:01'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeAvanceDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:01'!
apagar
	self color: Color black.! !

!SeñalDeAvanceDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:01'!
prender
	self color: Color green.! !


!SeñalDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceDeScalabriniOrtiz category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeAvanceDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeScalabriniOrtiz class' category: #'Semaforo-ClassBased'!
SeñalDeAvanceDeScalabriniOrtiz class
	instanceVariableNames: ''!

!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:56:28'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:55:52'!
apagar
	self color: Color black.! !

!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:41'!
prender
	self color: Color green.! !


!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeCorrientes category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeDetencionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeCorrientes class' category: #'Semaforo-ClassBased'!
SeñalDeDetencionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeDetencionDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:55:11'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeDetencionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:11'!
apagar
	self color: Color black.! !

!SeñalDeDetencionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:11'!
prender
	self color: Color red.! !


!SeñalDeDetencionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeScalabriniOrtiz category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeDetencionDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeScalabriniOrtiz class' category: #'Semaforo-ClassBased'!
SeñalDeDetencionDeScalabriniOrtiz class
	instanceVariableNames: ''!

!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:57:58'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:08'!
apagar
	self color: Color black.! !

!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:52'!
prender
	self color: Color red.! !


!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeCorrientes category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDePrecaucionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeCorrientes class' category: #'Semaforo-ClassBased'!
SeñalDePrecaucionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeCorrientes class methodsFor: 'morph' stamp: 'GSC 3/26/2019 00:55:18'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDePrecaucionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:18'!
apagar
	self color: Color black.! !

!SeñalDePrecaucionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:18'!
prender
	self color: Color yellow.! !


!SeñalDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeScalabriniOrtiz category: #'Semaforo-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDePrecaucionDeScalabriniOrtiz
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionDeScalabriniOrtiz class' category: #'Semaforo-ClassBased'!
SeñalDePrecaucionDeScalabriniOrtiz class
	instanceVariableNames: ''!

!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'morph' stamp: 'GSC 3/25/2019 19:57:48'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:17'!
apagar
	self color: Color black.! !

!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:57:05'!
prender
	self color: Color yellow.! !


!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 3/26/2019 02:02:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

ControladorDeTransito initializeAfterFileIn!
SemaforoDeCorrientes initializeAfterFileIn!
SemaforoDeScalabriniOrtiz initializeAfterFileIn!
SeñalDeAvanceDeCorrientes initializeAfterFileIn!
SeñalDeAvanceDeScalabriniOrtiz initializeAfterFileIn!
SeñalDeDetencionDeCorrientes initializeAfterFileIn!
SeñalDeDetencionDeScalabriniOrtiz initializeAfterFileIn!
SeñalDePrecaucionDeCorrientes initializeAfterFileIn!
SeñalDePrecaucionDeScalabriniOrtiz initializeAfterFileIn!