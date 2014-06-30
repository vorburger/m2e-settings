## Usage

In order to use the plugin you need to configure the Maven build, and
install a plugin in Eclipse to extract the POM settings into a working
Eclipse configuration. Usage example:

### POM Configuration

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

### Installing the Eclipse plugin

- Download the zip file provided (`nl.topicus.m2e.settings.feature-2.0.1-SNAPSHOT-site.zip`)
- Select "Install new software" (OS X: under Help)
- Click "Add"
- Click "Archive..."
- Navigate to the downloaded ZIP file and select it
- Open the tree and select the "Eclipse Settings for M2E" item
- Click "Next" ad infinitum

## Building a release

Run the following Maven command from the root folder of the
m2e-settings project:

``` bash
mvn package
```

After all bytes have been consumed from the internet Maven will create
a ZIP file in `nl.topicus.m2e.settings.feature/target`, for example:

- `nl.topicus.m2e.settings.feature-2.0.1-SNAPSHOT-site.zip`

you can distribute this file to your team members and have them install
this through "Install new software -> Add" and clicking the
"Archive..." button.

