function Add-EnrichWith {
    <#
    .SYNOPSIS
        Adds a custom Serilog ILogEventEnricher to the logger configuration.
    .DESCRIPTION
        Allows adding any Serilog ILogEventEnricher (custom or built-in) to a LoggerConfiguration.
    .PARAMETER LoggerConfig
        Instance of LoggerConfiguration
    .PARAMETER Enricher
        Instance of a Serilog.Core.ILogEventEnricher
    .INPUTS
        None
    .OUTPUTS
        LoggerConfiguration object allowing method chaining
    .EXAMPLE
        $logger = New-Logger | Add-EnrichWith -Enricher ([OstrologyXSerilog.TimestampEnricher]::new())
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [Serilog.LoggerConfiguration]$LoggerConfig,

        [Parameter(Mandatory = $true)]
        [Serilog.Core.ILogEventEnricher]$Enricher
    )

    process {
        $LoggerConfig = $LoggerConfig.Enrich.With($Enricher)
        $LoggerConfig
    }
}
