## Usage

Update site URL:

 - https://github.com/topicusonderwijs/m2e-settings/raw/master/site


### Installing the Eclipse plugin

- Add a new update site to your Eclipse settings:
- Select "Install new software" (OS X: under Help)
- Click "Add"
- Fill in the Name field: "M2E Settings plugin"
- Fill in the Location field: "https://github.com/topicusonderwijs/m2e-settings/raw/master/site"
- Click "OK"
- Click "Next" ad infinitum

### Project configuration

In order to use the plugin you need to configure the Maven build, and
install a plugin in Eclipse to extract the POM settings into a working
Eclipse configuration. Usage example:

``` xml
<build>
	<plugins>
		<plugin>
			<groupId>org.eclipse.m2e.settings</groupId>
			<artifactId>maven-m2e-settings-plugin</artifactId>
			<version>1.2.1</version>
			<configuration>
				<formatter>
					<filename>sample-formatting.xml</filename>
				</formatter>
				<preference>
					<filename>edu.umd.cs.findbugs.plugin.eclipse.prefs</filename>
					<name>edu.umd.cs.findbugs.plugin.eclipse</name>
				</preference>
			</configuration>
			<dependencies>
				<dependency>
					<groupId>org.eclipse.m2e.settings</groupId>
					<artifactId>sample-configuration-artifact</artifactId>
					<version>1.0.0</version>
				</dependency>
			</dependencies>
		</plugin>
	</plugins>
</build>
```

## Building a release

Run the release shell script from the root folder of the m2e-settings
project:

``` bash
./release.sh
```

This script performs the following steps:

- assign a new release version number to the current workspace
- create a new distribution of the new version in the current workspace
- create an updated P2 repository in the current workspace
- commit all these results into the git repository

This doesn't push the intermediate results to github, this is a manual
step you have to do to release a new version.

## Uploading a release

When you have checked the release and it is found OK, then you can
upload the new version to github and instruct your team to perform an
update:

```
git push
```

This will push the changes to github and publish a new update site to
the update site URL.
