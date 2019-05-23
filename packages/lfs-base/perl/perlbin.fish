if status --is-login
    for perldir in /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl
        if test -d $perldir; and not contains $perldir $PATH
            set PATH $PATH $perldir
        end
    end
end
