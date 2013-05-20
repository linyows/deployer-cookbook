Deployer Cookbook
=================

This cookbook makes your deployment user.

Usage
-----

Just include deployer in your node's run_list:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[deployer]"
  ],
  "override_attributes": {
      "deployer": {
          "data_gag_id": "jenkins"
      }
  }
}
```

A data bag called "users" with an item for your user like the following:

```json
{
  "id": "jenkins",
  "key": "ssh-rsa AAAAB3NzaC1yc....",
  "deployer": {
    "deployment_root": "/var/www"
  }
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Authors and Contributors
------------------------

- [linyows](https://github.com/linyows)

License
-------

MIT
