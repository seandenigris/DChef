Class {
	#name : 'BaselineOfDynaChef',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfDynaChef'
}

{ #category : 'configuration' }
BaselineOfDynaChef class >> dataFolder [
	^ FileLocator dynabookData / 'DynaChef'
]

{ #category : 'accessing' }
BaselineOfDynaChef class >> localRepository [
	^ FileLocator localDirectory / 'iceberg' / 'seandenigris' / 'DynaChef'
]

{ #category : 'baselines' }
BaselineOfDynaChef >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'Aconcagua' with: [
				spec repository: 'github://seandenigris/aconcagua:denigris' "Default branch of upstream (ba-st)" ];
			baseline: 'ExternalWebBrowser' with: [
				spec repository: 'github://seandenigris/Pharo-Web-Browser' ];
			baseline: 'Mocketry' with: [
				spec repository: 'github://seandenigris/Mocketry' ];
			baseline: 'OSSubprocess' with: [
				spec repository: 'github://pharo-contributions/OSSubprocess' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'ResourcesLive' with: [
				spec repository: 'github://seandenigris/Resources-Live' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ];
			baseline: 'SocketServer4Pharo' with: [
				spec repository: 'github://seandenigris/SocketServer4Pharo:main' ].
		"spec package: #DynaChef with: [
				spec requires: #('Aconcagua' 'ExternalWebBrowser' 'Mocketry' 'OSSubprocess' 'PharoEnhancements' 'ResourcesLive' 'SimplePersistence' 'SocketServer4Pharo'). ]." ].
				
	spec for: #notGToolkit do: [ 
		spec
			baseline: 'PetitParser2' with: [
				spec repository: 'github://seandenigris/PetitParser2' ].
		"spec package: #DynaChef with: [
				spec requires: #('PetitParser2'). ]." ]

]

{ #category : 'accessing' }
BaselineOfDynaChef >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : 'testing' }
BaselineOfDynaChef >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]
