Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Base64コードをデコードします。'
$form.Size = New-Object System.Drawing.Size(550,350)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,220)
$okButton.Size = New-Object System.Drawing.Size(75,30)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,220)
$cancelButton.Size = New-Object System.Drawing.Size(75,30)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Bas64コードを入力ください:'
$form.Controls.Add($label)

#$textBox = New-Object System.Windows.Forms.TextBox
#$textBox.Location = New-Object System.Drawing.Point(10,40)
#$textBox.Size = New-Object System.Drawing.Size(260,20)
#$form.Controls.Add($textBox)

$textBox = New-Object 'System.Windows.Forms.TextBox'
$textBox.Location = '12, 50'
$textBox.Multiline = $true
$textBox.Size = '470, 150'
$textBox.TabIndex = 1
$textBox.Font = New-Object System.Drawing.Font("Lucida Console",14,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
 $output =[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($textBox.Text))
 #| Out-File -Encoding "ASCII" c:\TMP\decoded.txt
 #$outfile = get-content c:\TMP\decoded.txt
 #$final = Write-Host "DECODED: " $output
 [System.Windows.MessageBox]::Show($output,"Base64デコード結果”)
 #Write-Host "Decoded text is as follows" -ForegroundColor Green
 #Write-Host "DECODED: " $output
}