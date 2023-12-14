<#
.SYNOPSIS
    Tests for Tasks .NET SDK
#>

# convention used for tagging Pester tests
$filenameTag = $MyInvocation.MyCommand.Name.Replace(".Tests.ps1", "")

Describe "Pester Requirements"   {
    Context 'TestDrive' -Tag UnitTest, $filenameTag {
        It 'TestDrive should point to a valid path'{
            $WorkingDirectory = $TestDrive

            $WorkingDirectory | Should -Not -BeNullOrEmpty # Remove Script Warning for unused variable
            Test-Path $WorkingDirectory | Should -BeTrue
        }
    }
}

Describe 'DotNet Requirement Requirements' -Tag DotNetRequirement, $filenameTag -Skip:($Skip) {
    Context 'DotNet CLI' -Tag DotNetCLI, IntegrationTest {
        It "should be installed" {
            $commandInfo =  Get-Command dotnet -CommandType Application

            $commandInfo | Should -Not -BeNullOrEmpty -Because "dotnet CLI is required to build the SDK"
        }

    }

    Context 'DotNet CLI - Project Automation' -Tag ProjectAutomation, IntegrationTest {
        BeforeAll {
            $WorkingDirectory = $TestDrive
            $ProjectName = "HelloWorld"
            $ProjectFolderPath = Join-Path  -Path $WorkingDirectory -ChildPath $ProjectName
            dotnet new console -n $ProjectName -o $ProjectFolderPath
        }

        It "should create a new dotnet console application" -Tag DotNetCreateConsoleProject, IntegrationTest  {
            # Given / When: see Context BeforeAll()

            # Then
            $ExpectedProjectFilePath = Join-Path  -Path $ProjectFolderPath -ChildPath "$ProjectName.csproj"
            Test-Path -Path $ExpectedProjectFilePath | Should -Not -BeNullOrEmpty -Because "dotnet CLI should create the project file"
            
        }

        It "should be provide build directory to hold assembly files" -Tag DotNetBuildDirectory, IntegrationTest  {
            # Given
            $ExpectedProjectFilePath = Join-Path  -Path $ProjectFolderPath -ChildPath "$ProjectName.csproj"

            # When
            dotnet build $ExpectedProjectFilePath

            # Then
            $ExpectedConsoleExecutablePath = Join-Path -Path $ProjectFolderPath -ChildPath "bin/Debug/net8.0/$ProjectName"
            Get-Item $ExpectedConsoleExecutablePath | Should -Exist -Because "dotnet CLI should build the project"
        }

        It "should provide output for project execution" -Tag DotNetCreateConsoleProject, IntegrationTest  {
            # Given
            $ExpectedProjectFilePath = Join-Path  -Path $ProjectFolderPath -ChildPath "$ProjectName.csproj"
            $ExpectedConsoleExecutablePath = Join-Path -Path $ProjectFolderPath -ChildPath "bin/Debug/net8.0/$ProjectName"

            # When
            dotnet build $ExpectedProjectFilePath

            # Then
            $output = Join-Path -Path $WorkingDirectory -ChildPath "output.txt"
            Start-Process -FilePath $ExpectedConsoleExecutablePath -RedirectStandardOutput $output -Wait
            Get-Content -Path $output | Should -Be "Hello, World!" -Because "dotnet CLI should build the project"
        }
    }
}

