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


!ControladorDeTransito class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	semaforoDeCorrientes := SemaforoDeCorrientes.
	semaforoDeScalabriniOrtiz := SemaforoDeScalabriniOrtiz.
	intervaloSeñalEnSegundos := 2.! !


!classDefinition: #SemaforoDeCorrientes category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SemaforoDeCorrientes
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


!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:13:16'!
apagar
	señalDeDetencion apagar.
	señalDePrecaucion apagar.
	señalDeAvance apagar.! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:17:53'!
avisarAvance
	señalDePrecaucion apagar.
	señalDeAvance prender.
	! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:18:02'!
avisarDetencion
	señalDePrecaucion apagar.
	señalDeDetencion prender.
	! !

!SemaforoDeCorrientes class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:18:19'!
avisarPrecaucion
	señalDeAvance apagar.
	señalDeDetencion apagar.
	señalDePrecaucion prender.
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


!SemaforoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeCorrientes.
	señalDePrecaucion := SeñalDePrecaucionDeCorrientes.
	señalDeAvance := SeñalDeAvanceDeCorrientes.
	tiempoDeCadaSeñal := 1.! !


!classDefinition: #SemaforoDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SemaforoDeScalabriniOrtiz
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


!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/26/2019 01:14:04'!
apagar
	señalDeDetencion apagar.
	señalDePrecaucion apagar.
	señalDeAvance apagar.! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:17:30'!
avisarAvance
	señalDePrecaucion apagar.
	señalDeAvance prender.
	! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:17:17'!
avisarDetencion
	señalDePrecaucion apagar.
	señalDeDetencion prender.
	! !

!SemaforoDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 4/1/2019 20:16:40'!
avisarPrecaucion
	señalDeAvance apagar.
	señalDeDetencion apagar.
	señalDePrecaucion prender.
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


!SemaforoDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	señalDeDetencion := SeñalDeDetencionDeScalabriniOrtiz.
	señalDePrecaucion := SeñalDePrecaucionDeScalabriniOrtiz.
	señalDeAvance := SeñalDeAvanceDeScalabriniOrtiz.
	tiempoDeCadaSeñal := 1.! !


!classDefinition: #SeñalDeAvanceDeCorrientes category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeAvanceDeCorrientes
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


!SeñalDeAvanceDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:01'!
apagar
	self color: Color black.! !

!SeñalDeAvanceDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:01'!
prender
	self color: Color green.! !


!SeñalDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeAvanceDeScalabriniOrtiz
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


!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:55:52'!
apagar
	self color: Color black.! !

!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:41'!
prender
	self color: Color green.! !


!SeñalDeAvanceDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeCorrientes category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeDetencionDeCorrientes
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


!SeñalDeDetencionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:11'!
apagar
	self color: Color black.! !

!SeñalDeDetencionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:11'!
prender
	self color: Color red.! !


!SeñalDeDetencionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDeDetencionDeScalabriniOrtiz
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


!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:08'!
apagar
	self color: Color black.! !

!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:52'!
prender
	self color: Color red.! !


!SeñalDeDetencionDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeCorrientes category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDePrecaucionDeCorrientes
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


!SeñalDePrecaucionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:18'!
apagar
	self color: Color black.! !

!SeñalDePrecaucionDeCorrientes class methodsFor: 'services' stamp: 'GSC 3/26/2019 00:55:18'!
prender
	self color: Color yellow.! !


!SeñalDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionDeScalabriniOrtiz category: #'ControladorDeTransito-ClassBased'!
DenotativeObjectMorph subclass: #SeñalDePrecaucionDeScalabriniOrtiz
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


!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:56:17'!
apagar
	self color: Color black.! !

!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'services' stamp: 'GSC 3/25/2019 21:57:05'!
prender
	self color: Color yellow.! !


!SeñalDePrecaucionDeScalabriniOrtiz class methodsFor: 'as yet unclassified' stamp: 'GSC 4/1/2019 20:44:16'!
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