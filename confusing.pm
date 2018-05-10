########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.170.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'confusing.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package confusing;
use strict;

push @confusing::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "confusing.eyp"


=head1 SYNOPSIS

A deliberately confusing example

For this grammar, an example input that starts C<x y c> is enough to confuse an
LR(1) parser, as it has to decide whether C<x y> matches B or E after only seeing
1 symbol further (i.e. c).

An LL(1) parser would also be confused, but at the C<x> - should it expand C<A> to
C<B c d> or to C<E c f>, as both can start with C<x>. An LL(2) or LL(3) parser
would have similar problems at the y or c respectively.

An LR(2) parser would be able to also see the d or f that followed the c and so
make the correct choice between B and E.

An LL(4) parser would also be able to look far enough ahead to see the d or f
that followed the c and so make the correct choice between expanding A to B c d
or to E c f. 


=head1 SEE ALSO

I have seen this example at Jinks page:
L<http://www.cs.man.ac.uk/~pjj>

Different solutions can be found in files:

   confusingsolvedstatic.eyp 
   confusingsolvedstatic2.eyp 
   confusingsolveddynamic.eyp

See 

   http://www.cs.man.ac.uk/~pjj/cs2121/ho/node19.html

=cut



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(x|c|d|y|f)}gc and return ($1, $1);



      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      /\G\s*(\S+)/;
      my $near = substr($1,0,10); 

      return($near, $near);

     # die( "Error inside the lexical analyzer near '". $near
     #     ."'. Line: ".$self->line()
     #     .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


#line 100 ./confusing.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@confusing::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.170',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'A', '$end' ], 0 ],
  [ 'A_1' => 'A', [ 'B', 'c', 'd' ], 0 ],
  [ 'A_2' => 'A', [ 'E', 'c', 'f' ], 0 ],
  [ 'B_3' => 'B', [ 'x', 'y' ], 0 ],
  [ 'E_4' => 'E', [ 'x', 'y' ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'c' => { ISSEMANTIC => 0 },
	'd' => { ISSEMANTIC => 0 },
	'f' => { ISSEMANTIC => 0 },
	'x' => { ISSEMANTIC => 0 },
	'y' => { ISSEMANTIC => 0 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'confusing.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"x" => 1
		},
		GOTOS => {
			'A' => 2,
			'B' => 4,
			'E' => 3
		}
	},
	{#State 1
		ACTIONS => {
			"y" => 5
		}
	},
	{#State 2
		ACTIONS => {
			'' => 6
		}
	},
	{#State 3
		ACTIONS => {
			"c" => 7
		}
	},
	{#State 4
		ACTIONS => {
			"c" => 8
		}
	},
	{#State 5
		ACTIONS => {
			"c" => -3
		}
	},
	{#State 6
		DEFAULT => 0
	},
	{#State 7
		ACTIONS => {
			"f" => 9
		}
	},
	{#State 8
		ACTIONS => {
			"d" => 10
		}
	},
	{#State 9
		DEFAULT => -2
	},
	{#State 10
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 192 ./confusing.pm
	],
	[#Rule A_1
		 'A', 3, undef
#line 196 ./confusing.pm
	],
	[#Rule A_2
		 'A', 3, undef
#line 200 ./confusing.pm
	],
	[#Rule B_3
		 'B', 2, undef
#line 204 ./confusing.pm
	],
	[#Rule E_4
		 'E', 2, undef
#line 208 ./confusing.pm
	]
],
#line 211 ./confusing.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'A_1', 
         'A_2', 
         'B_3', 
         'E_4', );
  $self;
}

#line 53 "confusing.eyp"



=for None

=cut


#line 241 ./confusing.pm



1;
