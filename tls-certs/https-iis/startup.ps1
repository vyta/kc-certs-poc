$secret=(Get-content C:\secrets\secrets\certtest);
$secretBytes = [System.Convert]::FromBase64String($secret);
[System.IO.File]::WriteAllBytes("C:\certtest.pfx", $secretBytes);

Import-Module IISAdministration; 
$cert = Import-PfxCertificate -FilePath C:\certtest.pfx -CertStoreLocation cert:\LocalMachine\My -Exportable
$certHash = $cert.GetCertHash();
$sm = Get-IISServerManager;
$sm.Sites["Default Web Site"].Bindings.Add("*:443:", $certHash, "My", "0");
$sm.CommitChanges();

C:\ServiceMonitor.exe w3svc