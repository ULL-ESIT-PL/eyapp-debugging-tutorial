########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.175.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'lastD.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package lastD;
use strict;

push @lastD::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "lastD.eyp"

=head1 SYNOPSIS

See http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut
This file solves the conflict in Debug.eyp using dynamic 
conflict resolution techniques
(see section 'SOLVING CONFLICTS WITH THE POSTPONED CONFLICT STRATEGY' in
http://search.cpan.org/perldoc?Parse::Eyapp::debuggingtut)

Be sure C<DebugTail.pm> is reachable
compile it with 

      $ eyapp -C DebugDynamicResolution4.eyp

Execute the generated modulino with:

       ./DebugDynamicResolution.pm -t -i -c 'D;D;S;S'

It will output s.t. like C<PROG(D(TERMINAL[D],D[D]),SS(TERMINAL[S],S[S]))>

=head1 See also

    Debug.eyp Debug1.eyp Debug2.eyp DebugLookForward.eyp

=cut



# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(S|\;)}gc and return ($1, $1);



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


#line 87 ./lastD.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@lastD::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.175',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'lastD', '$end' ], 0 ],
  [ 'lastD_1' => 'lastD', [ ';', 'S' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'lastD_1' => 1,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	S => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'lastD.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			";" => 1
		},
		GOTOS => {
			'lastD' => 2
		}
	},
	{#State 1
		ACTIONS => {
			'S' => 3
		}
	},
	{#State 2
		DEFAULT => 4
	},
	{#State 3
		DEFAULT => -1
	},
	{#State 4
		DEFAULT => 0
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 146 ./lastD.pm
	],
	[#Rule lastD_1
		 'lastD', 2, undef
#line 150 ./lastD.pm
	]
],
#line 153 ./lastD.pm
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
         'lastD_1', );
  $self;
}

#line 35 "lastD.eyp"




=for None

=cut


#line 181 ./lastD.pm



1;
