#ZSH function to tag files using hardlinks

SEMANTIC_BASE="/home/user/semantic";

function tag () 
{
	last_arg=$@[$#]; # $# is number of arguments, $@ is syntax to access nth argument
	for ((j=1; j < $#; j++)); do # actual arguments start from 1
		file_only=`basename "$@[$j]"`;
		combined=""; 
		for ((i=1; i <= 10; i++)); do # cut starts from 1; 
			tag=`echo "$last_arg" | cut -d '/' -f $i`; # assuming input in form of single tag, or nested tags separated by slashes, like e.g. Gmail
			if [[ ! -z $tag ]]; then #if not empty; I never expect full 10 tags to be provided
				combined="${combined}/${tag}"; 
				mkdir -p "${SEMANTIC_BASE}/${combined}"; # mkdir with parent switch, also ignores already existing, perfect
				mkdir -p "${SEMANTIC_BASE}/${tag}";
				ln $1 "${SEMANTIC_BASE}/${combined}/${file_only}" 2> /dev/null; # one link at every step of the newly created hierarchy; dev/null redirection of errors not optimal, but I expect duplicates with this schema
				ln $1 "${SEMANTIC_BASE}/${tag}/${file_only}" 2> /dev/null; # plus all tag levels also get life as a "leaf" tag
			fi; 
		done;	
	done;
}
