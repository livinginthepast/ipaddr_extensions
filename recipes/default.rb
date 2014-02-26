# This recipe does nothing, but it does force the ipaddr_extensions cookbook
# to stay in the runlist. See libraries/gem_installation for the heart of the
# craziness. Since the node needs to be updated from ohai before any attribute
# files load, we have to go to the bad place. chef_gem and ohai_plugin providers
# run too late for this to be effective.
