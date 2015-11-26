as yet unclassified
addIntermediaryUsing: es to: v
	| new newElements tes e1 e2 |
	es size = 1
		ifTrue: [ ^ self ].
	newElements := OrderedCollection new.
	
	tes := es.
	[ tes notEmpty ] whileTrue: [ 
		e1 := tes first.
		e2 := tes second.	
		new := RTBox element.
		v add: new.	
		TRConstraint move: new between: e1 and: e2.
		new translateBy:
				self horizontalGap @ 0.
		tes removeFirst; removeFirst.
	
		v add: (RTMultiLine new orthoHorizontal edgeFrom: e1 to: new).
		v add: (RTMultiLine new orthoHorizontal edgeFrom: e2 to: new).
	
		newElements add: new
	].
"	es allButFirst
		do:
			[ :e | 
			new := RTBox element.
			v add: new.
			TRConstraint move: new between: trailer and: e.
			v add: (RTMultiLine new orthoHorizontal edgeFrom: trailer to: new).
			v add: (RTMultiLine new orthoHorizontal edgeFrom: e to: new).
			new translateBy:
				self horizontalGap @ 0.
			trailer := e.
			newElements add: new ]."
	self addIntermediaryUsing: newElements to: v