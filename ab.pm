########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.178.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'ab.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package ab;
use strict;

push @ab::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(c|a|b)}gc and return ($1, $1);

      /\G\Z/gc and return ('EOF', $1);


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


#line 61 ./ab.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@ab::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.178',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 's', '$end' ], 0 ],
  [ 's_1' => 's', [ 'ab', 'c' ], 0 ],
  [ 's_2' => 's', [ 'ab', 'EOF' ], 0 ],
  [ 'ab_3' => 'ab', [  ], 0 ],
  [ 'ab_4' => 'ab', [ 'a', 'ab', 'b' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  's_1' => 1,
  's_2' => 2,
  'ab_3' => 3,
  'ab_4' => 4,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'a' => { ISSEMANTIC => 0 },
	'b' => { ISSEMANTIC => 0 },
	'c' => { ISSEMANTIC => 0 },
	EOF => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'ab.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"a" => 2
		},
		DEFAULT => -3,
		GOTOS => {
			'ab' => 1,
			's' => 3
		}
	},
	{#State 1
		ACTIONS => {
			"c" => 4,
			'EOF' => 5
		}
	},
	{#State 2
		ACTIONS => {
			"a" => 2
		},
		DEFAULT => -3,
		GOTOS => {
			'ab' => 6
		}
	},
	{#State 3
		DEFAULT => 7
	},
	{#State 4
		DEFAULT => -1
	},
	{#State 5
		DEFAULT => -2
	},
	{#State 6
		ACTIONS => {
			"b" => 8
		}
	},
	{#State 7
		DEFAULT => 0
	},
	{#State 8
		DEFAULT => -4
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 151 ./ab.pm
	],
	[#Rule s_1
		 's', 2, undef
#line 155 ./ab.pm
	],
	[#Rule s_2
		 's', 2, undef
#line 159 ./ab.pm
	],
	[#Rule ab_3
		 'ab', 0, undef
#line 163 ./ab.pm
	],
	[#Rule ab_4
		 'ab', 3, undef
#line 167 ./ab.pm
	]
],
#line 170 ./ab.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    yystateconflict => {  },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         's_1', 
         's_2', 
         'ab_3', 
         'ab_4', );
  $self;
}

#line 11 "ab.eyp"




=for None

=cut


#line 202 ./ab.pm



1;
