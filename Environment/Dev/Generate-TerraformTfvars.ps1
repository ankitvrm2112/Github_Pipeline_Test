# ============================================================
# Generate terraform.tfvars from Resource_input.csv
# ============================================================

$CsvFile = "Resource_input.csv"
$OutputFile = "terraform.tfvars"

# Check CSV exists
if (-not (Test-Path $CsvFile)) {
    Write-Host "ERROR: $CsvFile not found!" -ForegroundColor Red
    exit 1
}

# Import CSV
$Data = Import-Csv -Path $CsvFile

if ($Data.Count -eq 0) {
    Write-Host "ERROR: CSV file is empty!" -ForegroundColor Red
    exit 1
}

# ============================================================
# RGs
# ============================================================

$RGs = @{}
$rgCounter = 1

foreach ($row in $Data) {

    if (-not $RGs.ContainsKey($row.RGName)) {

        $RGs[$row.RGName] = @{
            Key      = "RG$rgCounter"
            Name     = $row.RGName
            Location = $row.Location
        }

        $rgCounter++
    }
}

# ============================================================
# VNets
# ============================================================

$VNets = @{}
$vnetCounter = 1

foreach ($row in $Data) {

    if (-not $VNets.ContainsKey($row.VnetName)) {

        $VNets[$row.VnetName] = @{
            Key               = "vnet$vnetCounter"
            Name              = $row.VnetName
            AddressSpace      = $row.VnetAddressSpace
            Location          = $row.Location
            ResourceGroupName = $row.RGName
        }

        $vnetCounter++
    }
}

# ============================================================
# Subnets
# ============================================================

$Subnets = @{}
$subnetCounter = 1

foreach ($row in $Data) {

    if (-not $Subnets.ContainsKey($row.SubnetName)) {

        $Subnets[$row.SubnetName] = @{
            Key                 = "subnet$subnetCounter"
            Name                = $row.SubnetName
            ResourceGroupName   = $row.RGName
            VirtualNetworkName  = $row.VnetName
            AddressPrefixes     = $row.SubnetAddressPrefix
        }

        $subnetCounter++
    }
}

# ============================================================
# Generate Terraform file
# ============================================================

$Output = @()

# ---------------- RGs ----------------

$Output += "RGs = {"

foreach ($rg in $RGs.Values) {

    $Output += "  $($rg.Key) = {"
    $Output += "    name     = `"$($rg.Name)`""
    $Output += "    location = `"$($rg.Location)`""
    $Output += "  }"
}

$Output += "}"
$Output += ""

# ---------------- VNets ----------------

$Output += "Vnets = {"

foreach ($vnet in $VNets.Values) {

    $Output += "  $($vnet.Key) = {"
    $Output += "    name                = `"$($vnet.Name)`""
    $Output += "    address_space       = [`"$($vnet.AddressSpace)`"]"
    $Output += "    location            = `"$($vnet.Location)`""
    $Output += "    resource_group_name = `"$($vnet.ResourceGroupName)`""
    $Output += "  }"
}

$Output += "}"
$Output += ""

# ---------------- Subnets ----------------

$Output += "Subnets = {"

foreach ($subnet in $Subnets.Values) {

    $Output += "  $($subnet.Key) = {"
    $Output += "    name                 = `"$($subnet.Name)`""
    $Output += "    resource_group_name  = `"$($subnet.ResourceGroupName)`""
    $Output += "    virtual_network_name = `"$($subnet.VirtualNetworkName)`""
    $Output += "    address_prefixes     = [`"$($subnet.AddressPrefixes)`"]"
    $Output += "  }"
}

$Output += "}"

# ============================================================
# Write terraform.tfvars
# ============================================================

$Output | Set-Content -Path $OutputFile -Encoding UTF8

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "terraform.tfvars generated successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Output File: $OutputFile" -ForegroundColor Cyan
Write-Host ""