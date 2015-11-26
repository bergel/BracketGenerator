as yet unclassified
visualize
	| v es |
	v := RTView new.
	es := RTBox elementsOn: (1 to: self numberOfParticipants).
	v addAll: es.
	RTVerticalLineLayout new
		gapSize: self verticalGap;
		on: es.
	self addIntermediaryUsing: (OrderedCollection withAll: es) to: v.

	names with: es do: [ :n :e | 
		| element |
		element := RTLabel elementOn: n.
		v add: element.
		TRConstraint move: element onTheLeftOf: e ].
	^ v