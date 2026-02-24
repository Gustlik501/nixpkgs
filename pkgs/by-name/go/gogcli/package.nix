{
  lib,
  buildGoModule,
  fetchFromGitHub,
  versionCheckHook,
}:

buildGoModule (finalAttrs: {
  pname = "gogcli";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "steipete";
    repo = "gogcli";
    tag = "v${finalAttrs.version}";
    hash = "sha256-hJU40ysjRx4p9SWGmbhhpToYCpk3DcMAWCnKqxHRmh0=";
  };

  vendorHash = "sha256-WGRlv3UsK3SVBQySD7uZ8+FiRl03p0rzjBm9Se1iITs=";

  subPackages = [ "cmd/gog" ];

  ldflags = [
    "-s"
    "-w"
  ];

  nativeInstallCheckInputs = [ versionCheckHook ];
  doInstallCheck = true;

  meta = {
    description = "Google Workspace CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs";
    homepage = "https://github.com/steipete/gogcli";
    changelog = "https://github.com/steipete/gogcli/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mit;
    mainProgram = "gog";
  };
})
