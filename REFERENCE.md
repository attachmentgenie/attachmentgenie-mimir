# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

#### Public Classes

* [`mimir`](#mimir): Class to install and configure mimir.  Use this module to install and configure mimir.
* [`mimir::repo`](#mimirrepo): A short summary of the purpose of this class

#### Private Classes

* `mimir::config`: Class to configure mimir.
* `mimir::install`: Class to install mimir.
* `mimir::service`: Class to manage the mimir service.

## Classes

### <a name="mimir"></a>`mimir`

Class to install and configure mimir.

Use this module to install and configure example.

#### Examples

##### Declaring the class

```puppet
include ::example
```

#### Parameters

The following parameters are available in the `example` class:

* [`archive_source`](#archive_source)
* [`group`](#group)
* [`install_dir`](#install_dir)
* [`install_method`](#install_method)
* [`manage_repo`](#manage_repo)
* [`manage_service`](#manage_service)
* [`manage_user`](#manage_user)
* [`package_name`](#package_name)
* [`package_version`](#package_version)
* [`service_name`](#service_name)
* [`service_provider`](#service_provider)
* [`service_ensure`](#service_ensure)
* [`user`](#user)

##### <a name="archive_source"></a>`archive_source`

Data type: `Optional[Stdlib::HTTPUrl]`

Location of example binary release.

Default value: ``undef``

##### <a name="group"></a>`group`

Data type: `String[1]`

Group that owns example files.

##### <a name="install_dir"></a>`install_dir`

Data type: `Stdlib::Absolutepath`

Location of example binary release.

##### <a name="install_method"></a>`install_method`

Data type: `Enum['archive','package']`

How to install example.

##### <a name="manage_repo"></a>`manage_repo`

Data type: `Boolean`

Manage the example repo.

##### <a name="manage_service"></a>`manage_service`

Data type: `Boolean`

Manage the example service.

##### <a name="manage_user"></a>`manage_user`

Data type: `Boolean`

Manage example user and group.

##### <a name="package_name"></a>`package_name`

Data type: `String[1]`

Name of package to install.

##### <a name="package_version"></a>`package_version`

Data type: `String[1]`

Version of example to install.

##### <a name="service_name"></a>`service_name`

Data type: `String[1]`

Name of service to manage.

##### <a name="service_provider"></a>`service_provider`

Data type: `String[1]`

Init system that is used.

##### <a name="service_ensure"></a>`service_ensure`

Data type: `Enum['running','stopped']`

The state of the service.

##### <a name="user"></a>`user`

Data type: `String[1]`

User that owns example files.

### <a name="examplerepo"></a>`example::repo`

A description of what this class does

#### Examples

##### 

```puppet
include example::repo
```

