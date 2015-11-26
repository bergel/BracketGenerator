as yet unclassified
OLDaddIntermediaryUsing: es to: v
	| trailer new newElements |
	es size = 1
		ifTrue: [ ^ self ].
	trailer := es first.
	newElements := OrderedCollection new.
	es allButFirst
		do:
			[ :e | 
			new := RTBox element.
			v add: new.
			TRConstraint move: new between: trailer and: e.
			v add: (RTMultiLine new "orthoHorizontal" edgeFrom: trailer to: new).
			v add: (RTMultiLine new "orthoHorizontal" edgeFrom: e to: new).
			new translateBy:
				self horizontalGap @ 0.
			trailer := e.
			newElements add: new ].
	self addIntermediaryUsing: newElements to: v