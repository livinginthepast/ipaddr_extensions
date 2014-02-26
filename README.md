ipaddr_extensions
=================

Adds the `ipaddr_extensions` gem to chef using the chef_gem provider. This adds a
top-level ohai attribute called `privateaddress`. If there is an RFC1918 IP address,
this is assigned to `node.privateaddress`.

## Usage

Include `ipaddr_extensions` in your Berksfile or Cheffile:

```ruby
cookbook 'ipaddr_extensions'
```

Include `ipaddr_extensions` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ipaddr_extensions]"
  ]
}
```

If a cookbook depends on knowing about private ip addresses, depend or suggest this cookbook.

```ruby
include_recipe 'ipaddr_extensions'
```

## Warning

This cookbook does terrible things that should never ever be done in
Chef, nor in Ruby for that matter. It should only do this once, after
which the `ipaddr_extensions` gem will be installed and working. There
are so many reasons this could go wrong, though.

## Running tests

This cookbook runs assertions as a part of a fake cookbook using
test-kitchen.

```bash
bundle
bundle exec kitchen converge
```

The test suite depends on network bridging in vagrant. This requires an
exact match of the interface name in order to work. If you run into
trouble, temporarily change `.kitchen.yml#L12` to match the name of your
ethernet adapter.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
