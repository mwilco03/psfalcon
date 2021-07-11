function Edit-FalconInstallToken {
<#
.Synopsis
Updates one or more tokens. Use this endpoint to edit labels, change expiration, revoke, or restore.
.Parameter Ids
One or more installation token identifiers
.Parameter Label
Installation token label
.Parameter ExpiresTimestamp
Installation token expiration time (RFC-3339)
.Parameter Revoked
Set revocation status of the installation token
.Role
installation-tokens:write
#>
    [CmdletBinding(DefaultParameterSetName = '/installation-tokens/entities/tokens/v1:patch')]
    param(
        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:patch', Mandatory = $true,
            Position = 1)]
        [ValidatePattern('^\w{32}$')]
        [array] $Ids,

        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:patch', Position = 2)]
        [string] $Label,

        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:patch', Position = 3)]
        [ValidatePattern('^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}\d{2}Z$')]
        [string] $ExpiresTimestamp,

        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:patch', Position = 4)]
        [boolean] $Revoked
    )
    begin {
        $Fields = @{
            ExpiresTimestamp = 'expires_timestamp'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Headers  = @{
                ContentType = 'application/json'
            }
            Format   = @{
                Query = @('ids')
                Body  = @{
                    root = @('label', 'revoked', 'expires_timestamp')
                }
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Get-FalconInstallToken {
<#
.Synopsis
Search for installation tokens
.Parameter Ids
One or more installation token identifiers
.Parameter Filter
Falcon Query Language expression to limit results
.Parameter Sort
Property and direction to sort results
.Parameter Limit
Maximum number of results per request
.Parameter Offset
Position to begin retrieving results
.Parameter Detailed
Retrieve detailed information
.Parameter All
Repeat requests until all available results are retrieved
.Parameter Total
Display total result count instead of results
.Role
installation-tokens:read
#>
    [CmdletBinding(DefaultParameterSetName = '/installation-tokens/queries/tokens/v1:get')]
    param(
        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:get', Mandatory = $true,
            Position = 1)]
        [ValidatePattern('^\w{32}$')]
        [array] $Ids,
        
        [Parameter(ParameterSetName = '/installation-tokens/queries/tokens/v1:get', Position = 2)]
        [string] $Filter,

        [Parameter(ParameterSetName = '/installation-tokens/queries/tokens/v1:get', Position = 3)]
        [string] $Sort,

        [Parameter(ParameterSetName = '/installation-tokens/queries/tokens/v1:get', Position = 4)]
        [ValidateRange(1,1000)]
        [int] $Limit,

        [Parameter(ParameterSetName = '/installation-tokens/queries/tokens/v1:get', Position = 5)]
        [int] $Offset,

        [Parameter(ParameterSetName = '/installation-tokens/queries/tokens/v1:get')]
        [switch] $Detailed,

        [Parameter(ParameterSetName = '/installation-tokens/queries/tokens/v1:get')]
        [switch] $All,

        [Parameter(ParameterSetName = '/installation-tokens/queries/tokens/v1:get')]
        [switch] $Total
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('sort', 'ids', 'offset', 'limit', 'filter')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Get-FalconInstallTokenEvent {
<#
.Synopsis
Search for installation token audit events
.Parameter Ids
One or more installation token audit event identifiers
.Parameter Filter
Falcon Query Language expression to limit results
.Parameter Sort
Property and direction to sort results
.Parameter Limit
Maximum number of results per request
.Parameter Offset
Position to begin retrieving results
.Parameter Detailed
Retrieve detailed information
.Parameter All
Repeat requests until all available results are retrieved
.Parameter Total
Display total result count instead of results
.Role
installation-tokens:read
#>
    [CmdletBinding(DefaultParameterSetName = '/installation-tokens/queries/audit-events/v1:get')]
    param(
        [Parameter(ParameterSetName = '/installation-tokens/entities/audit-events/v1:get', Mandatory = $true,
            Position = 1)]
        [ValidatePattern('^\w{32}$')]
        [array] $Ids,

        [Parameter(ParameterSetName = '/installation-tokens/queries/audit-events/v1:get', Position = 1)]
        [string] $Filter,

        [Parameter(ParameterSetName = '/installation-tokens/queries/audit-events/v1:get', Position = 2)]
        [string] $Sort,

        [Parameter(ParameterSetName = '/installation-tokens/queries/audit-events/v1:get', Position = 3)]
        [int] $Limit,
        
        [Parameter(ParameterSetName = '/installation-tokens/queries/audit-events/v1:get', Position = 4)]
        [int] $Offset,

        [Parameter(ParameterSetName = '/installation-tokens/queries/audit-events/v1:get')]
        [switch] $Detailed,

        [Parameter(ParameterSetName = '/installation-tokens/queries/audit-events/v1:get')]
        [switch] $All,

        [Parameter(ParameterSetName = '/installation-tokens/queries/audit-events/v1:get')]
        [switch] $Total
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('sort', 'ids', 'offset', 'limit', 'filter')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Get-FalconInstallTokenSettings {
<#
.Synopsis
Check current installation token settings.
.Role
installation-tokens:read
#>
    [CmdletBinding(DefaultParameterSetName = '/installation-tokens/entities/customer-settings/v1:get')]
    param()
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Headers  = @{
                ContentType = 'application/json'
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function New-FalconInstallToken {
<#
.Synopsis
Create an installation token
.Parameter Label
Installation Token label
.Parameter ExpiresTimestamp
Installation token expiration time (RFC-3339)
.Role
installation-tokens:write
#>
    [CmdletBinding(DefaultParameterSetName = '/installation-tokens/entities/tokens/v1:post')]
    param(
        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:post', Mandatory = $true,
            Position = 1)]
        [string] $Label,

        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:post', Mandatory = $true,
            Position = 2)]
        [ValidatePattern('^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}\d{2}Z$')]
        [string] $ExpiresTimestamp
    )
    begin {
        $Fields = @{
            ExpiresTimestamp = 'expires_timestamp'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Headers  = @{
                ContentType = 'application/json'
            }
            Format   = @{
                Body = @{
                    root = @('label', 'expires_timestamp')
                }
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Remove-FalconInstallToken {
<#
.Synopsis
Delete installation tokens
.Parameter Ids
One or more installation token identifiers identifiers
.Role
installation-tokens:write
#>
    [CmdletBinding(DefaultParameterSetName = '/installation-tokens/entities/tokens/v1:delete')]
    param(
        [Parameter(ParameterSetName = '/installation-tokens/entities/tokens/v1:delete', Mandatory = $true,
            Position = 1)]
        [ValidatePattern('^\w{32}$')]
        [array] $Ids
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('ids')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}