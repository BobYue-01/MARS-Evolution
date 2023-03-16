Get-ChildItem -Recurse -Include *.class | Remove-Item -Force

Get-ChildItem -Directory -Recurse | ForEach-Object {
	$folder = $_.FullName -replace ($pwd -replace "\\", "\\"), "."  # get relative paths
	# if contains .java files, compile them
	if (Get-ChildItem $_.FullName -Include *.java -Recurse) {
		Write-Host "Compiling $folder"
		& "C:\Program Files\Java\jdk-14.0.2\bin\javac.exe" $folder\*.java
	}
}

& "C:\Program Files\Java\jdk-14.0.2\bin\javac.exe" .\*.java

& jar cmf mainclass.txt Mars.jar PseudoOps.txt Config.properties Syscall.properties Settings.properties MARSlicense.txt mainclass.txt MipsXRayOpcode.xml registerDatapath.xml controlDatapath.xml ALUcontrolDatapath.xml Mars.java Mars.class docs help images mars themeengine screenshots