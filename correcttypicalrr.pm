#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'correcttypicalrr.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package correcttypicalrr;
use strict;

push @correcttypicalrr::ISA, 'Parse::Eyapp::Driver';




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
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      

      /\G(ID)/gc and return ($1, $1);
      /\G(NUM)/gc and return ($1, $1);


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


#line 63 ./correcttypicalrr.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@correcttypicalrr::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 's', '$end' ], 0 ],
  [ 's_1' => 's', [  ], 0 ],
  [ 's_2' => 's', [ 's', 'ID' ], 0 ],
  [ 's_3' => 's', [ 's', 'NUM' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  's_1' => 1,
  's_2' => 2,
  's_3' => 3,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	ID => { ISSEMANTIC => 1 },
	NUM => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'correcttypicalrr.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -1,
		GOTOS => {
			's' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'ID' => 4,
			'' => 3,
			'NUM' => 2
		}
	},
	{#State 2
		DEFAULT => -3
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		DEFAULT => -2
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 126 ./correcttypicalrr.pm
	],
	[#Rule s_1
		 's', 0, undef
#line 130 ./correcttypicalrr.pm
	],
	[#Rule s_2
		 's', 2, undef
#line 134 ./correcttypicalrr.pm
	],
	[#Rule s_3
		 's', 2, undef
#line 138 ./correcttypicalrr.pm
	]
],
#line 141 ./correcttypicalrr.pm
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
         's_3', );
  $self;
}

#line 12 "correcttypicalrr.eyp"



=for None

=cut


#line 171 ./correcttypicalrr.pm



1;
