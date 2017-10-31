# mackerel-plugin-registry

The registry of mackerel and check plugins.  Registered plugins can be installed by `mkr plugin install <plugin_name>`.

## How to install a plugin

You can find available plugins in the `plugins/` directory.

For example, if you want to the plugin defined in `mackerel-plugin-sample.json`, exec following command in your terminal.

```
$ mkr plugin install mackerel-plugin-sample
```

## How to register a plugin

1. Put your plugin on Github, and make your repository satisfy the specification of `mkr plugin install`.
2. Create `<plugin_name>.json` in the `plugins/` directory
3. Write the path of your plugin's repository to `source` field.
    - For example, if your plugin repository is https://github.com/mackerelio/mackerel-plugin-sample, write `mackerelio/mackerel-plugin-sample`.
4. Write the description of your plugin to `description` field.
5. Send pull request.

If you want an example, please see https://github.com/mackerelio/plugin-registry/blob/master/plugins/mackerel-plugin-sample.json .
