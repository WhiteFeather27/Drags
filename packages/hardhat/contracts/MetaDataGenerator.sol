// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import 'base64-sol/base64.sol';
import "@openzeppelin/contracts/utils/Strings.sol";
/// @title NFTSVG
/// @notice Provides a function for generating an SVG associated with a Uniswap NFT
library MetaDataGenerator {

  function generateConfigString(uint256 _tokenBaseFee, uint _fireHeight, string memory _readableBaseFee, address _owner, uint256 _tokenId) internal pure returns (string memory) {

    return string(abi.encodePacked(Strings.toString(_tokenBaseFee % 360),
    'deg)}#Fire_to_move{transform:translate(0px,',
    Strings.toString(_fireHeight),
    'px)}</style></defs><text dy="0" textLength="1200"><textPath xlink:href="#textcircle">Basefee: ',
    _readableBaseFee,
    ' / EIP-1159 / #',
    Strings.toString(_tokenId),
    '</textPath></text></svg>'));
  }

  function generateSVGofTokenById(uint256 _tokenId, uint256 _tokenBaseFee, string memory _readableBaseFee, address _owner, uint256 _minBaseFee, uint256 _maxBaseFee) internal pure returns (string memory) {

      uint height = 250;
      uint fireHeight;

      if(_minBaseFee == _maxBaseFee) {
        fireHeight = 0;
      } else {
        fireHeight = height*(uint(100)-(uint(100)*(_tokenBaseFee-_minBaseFee)/(_maxBaseFee-_minBaseFee))) / uint(100);
      }

      string memory svg = string(abi.encodePacked(
        '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 300 300"><style>#fire-001{animation:fire-001_c_o 300ms linear infinite normal forwards}@keyframes fire-001_c_o{0%{opacity:0}2.5%{opacity:1}50%{opacity:1}51%{opacity:0}100%{opacity:0}}#fire-002{animation:fire-003_c_o 300ms linear infinite normal forwards}@keyframes fire-003_c_o{0%{opacity:1}2.5%{opacity:0}50%{opacity:0}51%{opacity:1}100%{opacity:1}}</style><defs><style>.cls-1{fill:none}.cls-2{fill:url(#linear-gradient)}.cls-3{clip-path:url(#clip-path)}.cls-4{fill:url(#linear-gradient-2)}.cls-5{fill:url(#linear-gradient-3)}.cls-6{fill:url(#linear-gradient-4)}.cls-7{fill:url(#linear-gradient-5)}.cls-8{fill:url(#linear-gradient-6)}.cls-9{fill:url(#linear-gradient-7)}.cls-10{fill:url(#linear-gradient-8)}.cls-11{fill:url(#linear-gradient-9)}.cls-12{fill:url(#linear-gradient-10)}.cls-13{fill:url(#linear-gradient-11)}.cls-14{fill:url(#linear-gradient-12)}.cls-15{opacity:.2}.cls-16{clip-path:url(#clip-path-2)}.cls-17{fill:#e75a00}.cls-18{fill:url(#linear-gradient-13)}.cls-19{fill:#fff}.cls-20{fill:url(#linear-gradient-14)}.cls-21{fill:url(#linear-gradient-15)}.cls-22{fill:url(#linear-gradient-16)}.cls-23{fill:url(#linear-gradient-17)}.cls-24{fill:url(#linear-gradient-18)}.cls-25{stroke:#fff;stroke-miterlimit:10;fill:url(#linear-gradient-19)}</style><linearGradient id="linear-gradient" x1="150" x2="150" y2="300" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#00bdd0"/><stop offset="1" stop-color="#008ad0"/></linearGradient><clipPath id="clip-path"><path class="cls-1" d="M0-42.27h3e2v188.556H0z"/></clipPath><linearGradient id="linear-gradient-2" x1="30.727" y1="-8.193" x2="30.727" y2="141.476" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#f16d76"/><stop offset="1" stop-color="#ffa358"/></linearGradient><linearGradient id="linear-gradient-3" x1="34.492" y1="29.911" x2="34.492" y2="144.939" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#ffbd58"/><stop offset="1" stop-color="#f6ec47"/></linearGradient><linearGradient id="linear-gradient-4" x1="31.889" y1="2.463" x2="31.889" y2="146.294" xlink:href="#linear-gradient-2"/><linearGradient id="linear-gradient-5" x1="67.793" y1="27.936" x2="67.793" y2="74.465" xlink:href="#linear-gradient-2"/><linearGradient id="linear-gradient-6" x1="36.538" y1="-15.097" x2="36.538" y2="52.752" xlink:href="#linear-gradient-2"/><linearGradient id="linear-gradient-7" x1="33.573" y1="22.494" x2="33.573" y2="148.499" xlink:href="#linear-gradient-3"/><linearGradient id="linear-gradient-8" x1="23.125" y1="-8.283" x2="23.125" y2="155.935" xlink:href="#linear-gradient-2"/><linearGradient id="linear-gradient-9" x1="64.937" y1="6.704" x2="64.937" y2="99.971" xlink:href="#linear-gradient-2"/><linearGradient id="linear-gradient-10" x1="48.431" y1="-45.817" x2="48.431" y2="80.739" xlink:href="#linear-gradient-2"/><linearGradient id="linear-gradient-11" x1="25.61" y1="8.239" x2="25.61" y2="149.791" xlink:href="#linear-gradient-3"/><linearGradient id="linear-gradient-12" x1="150" y1="300" x2="150" y2="139.813" xlink:href="#linear-gradient-3"/><clipPath id="clip-path-2"><path class="cls-1" d="M.417.0h3e2v3e2H.417z"/></clipPath><linearGradient id="linear-gradient-13" x1="95.999" y1="202.431" x2="150" y2="202.431" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#574581"/><stop offset="1" stop-color="#4c235b"/></linearGradient><linearGradient id="linear-gradient-14" x1="150" y1="202.431" x2="204.001" y2="202.431" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#ea496a"/><stop offset="1" stop-color="#ea6b60"/></linearGradient><linearGradient id="linear-gradient-15" x1="150" y1="153.732" x2="204.001" y2="153.732" xlink:href="#linear-gradient-14"/><linearGradient id="linear-gradient-16" x1="204.001" y1="105.003" x2="150" y2="105.003" xlink:href="#linear-gradient"/><linearGradient id="linear-gradient-17" x1="95.999" y1="105.003" x2="150" y2="105.003" xlink:href="#linear-gradient-14"/><linearGradient id="linear-gradient-18" x1="95.999" y1="153.732" x2="150" y2="153.732" xlink:href="#linear-gradient-13"/><linearGradient id="linear-gradient-19" x1="149.087" y1="24.038" x2="149.087" y2="275.962" xlink:href="#linear-gradient-13"/></defs><g id="background"><path class="cls-2" d="M0 0h3e2v3e2H0z"/></g><g id="fire-layer"><g id="Fire_to_move" data-name="Fire to move"><g id="Fire1"><g id="fire-001"><path class="cls-4" d="M-4.377 139.215c-.46-12.2-17.556-31.486-9.668-49.029S6.991 77.291 9.949 60.2c0 0 10.354 9.623 1.151 21.618.0.0 13.311-3.776 12.818-14.571S25.4 51.5 16.523 49.253-5.663 30.811 7.155 13.718c0 0 2.465 14.394 13.805 8.1s20.707-26.089.986-26.539c0 0 12.326-8.1 19.721.45S32.3 22.714 38.216 27.213s13.8 5.847 13.311 15.743S35.751 61.848 41.174 66.346s19.344 1.5 19.678-3.363c.329-4.787-7.846-10.581-.943-20.027A18.7 18.7.0 0 0 68.9 54.8c9.86 5.548 12.206 17.841 2.344 26.839-6.738 6.147-14.955-3.449-15.941 5.847-.572 5.391 20.969 13.02 18.987 29.145-3.643 29.63 9.273 24.5-33.12 24.5C-6.378 141.137-4.377 139.215-4.377 139.215z"/><path class="cls-5" d="M34.945 144.939c-62.148.0-33.719-7.228-26.947-16.171 11.773-15.546-10.7-15.192-10.21-28.686S6.662 79.84 6.662 79.84 1.486 95.809 8.881 96.258s15.188-5.272 18.981-20.176c6.656-26.154.493-40.323-8.381-46.171A37.472 37.472.0 0 1 38.142 39.64c5.932 5.9-4.649 17.253-4.364 26.706.74 24.52 34.841 4.948 31.718-5.847.0.0 9.532 14.843-2.876 17.092-22.4 4.061-21.446 20.467-13.065 25.864S55.6 119.79 63.172 128.11C73.153 139.082 89.166 144.939 34.945 144.939z"/></g><g id="fire-002"><path class="cls-6" d="M37.783 152.677c-23.328.0-42.629.9-40.037-12.864s14.765-39.4 8.933-46.309S-2.984 95.02-12.7 92.342-31.869 71.923-27.981 63.929s26.8-.011 33-3.772 4.9-9.422 4.256-13.92S21.583 31.081 22.879 25.751s-10.368-10.6-3.888-23.288c0 0 7.776 11.741 23.976 20.623s-8.427 19.69-6.048 31.681 3.456 28.276 14.472 30.5 8.423-4.284 7.127-7.693S47.5 74.133 52.039 60.157c0 0 4.536 7.341 12.959 8.674s21.384.6 22.032 8.739S80.55 89.309 81.2 93.5s18.632.534 8.222 17.411-33.065 7.477-26.9 11.5C78.262 132.692 83.361 152.677 37.783 152.677z"/><path class="cls-7" d="M74.934 27.936s-14.256 6.44-14.256 11.177-.864 11.774 7.128 9S68.022 34.228 74.934 27.936z"/><path class="cls-8" d="M31.889-14.268c-.141-3.553-5.77 5.033-4.042 12.139S33.9 3.793 43.831 10.306c0 0 3.888-10.954.0-12.287S32.475.536 31.889-14.268z"/><path class="cls-9" d="M36.538 148.249c-19.923.0-47 2.519-38.792-8.436s31.415-50.52 16.277-54.441C.564 81.884-13.624 92.34-17.944 75.182s25.081.607 30.239-5.907 3.456-18.357 10.368-28.128S35.5 32.315 31.889 22.494c0 0 15.932 10.363 4.649 17.173s-18.524 13.088-9.02 24.574S38.647 95.872 51.175 95.922 72.62 84.735 65 75.182c0 0 10.867.2 11.3 7.9s-6.547 14.459-1.363 18.171 14.688.0 8.64 6.81-28.511 2.073-30.671 8.29 25.088 14.28 20.378 23.983C69 149.145 47.654 148.249 36.538 148.249z"/></g></g><use href="#Fire1" x="77" /><use href="#Fire1" x="154" /><use href="#Fire1" x="231" /><path class="cls-14" d="M0 139.813h3e2V3e2H0z"/></g></g><g id="ray"><g class="cls-15"><g class="cls-16"><path id="ray1" class="cls-17" d="M153.417 382.967q8.5-.108 16.851-.812l-16.851-171.09z"/></g><use href="#ray1" transform="rotate(5.625,150,150)"/><use href="#ray1" transform="rotate(11.25,150,150)"/><use href="#ray1" transform="rotate(16.875,150,150)"/><use href="#ray1" transform="rotate(22.5,150,150)"/><use href="#ray1" transform="rotate(28.125,150,150)"/><use href="#ray1" transform="rotate(33.75,150,150)"/><use href="#ray1" transform="rotate(39.375,150,150)"/><use href="#ray1" transform="rotate(45,150,150)"/><use href="#ray1" transform="rotate(50.625,150,150)"/><use href="#ray1" transform="rotate(56.25,150,150)"/><use href="#ray1" transform="rotate(61.875,150,150)"/><use href="#ray1" transform="rotate(67.5,150,150)"/><use href="#ray1" transform="rotate(73.125,150,150)"/><use href="#ray1" transform="rotate(78.75,150,150)"/><use href="#ray1" transform="rotate(84.375,150,150)"/><use href="#ray1" transform="rotate(90,150,150)"/><use href="#ray1" transform="rotate(95.625,150,150)"/><use href="#ray1" transform="rotate(101.25,150,150)"/><use href="#ray1" transform="rotate(106.875,150,150)"/><use href="#ray1" transform="rotate(112.5,150,150)"/><use href="#ray1" transform="rotate(118.125,150,150)"/><use href="#ray1" transform="rotate(123.75,150,150)"/><use href="#ray1" transform="rotate(129.375,150,150)"/><use href="#ray1" transform="rotate(135,150,150)"/><use href="#ray1" transform="rotate(140.625,150,150)"/><use href="#ray1" transform="rotate(146.25,150,150)"/><use href="#ray1" transform="rotate(151.875,150,150)"/><use href="#ray1" transform="rotate(157.5,150,150)"/><use href="#ray1" transform="rotate(163.125,150,150)"/><use href="#ray1" transform="rotate(168.75,150,150)"/><use href="#ray1" transform="rotate(174.375,150,150)"/><use href="#ray1" transform="rotate(180,150,150)"/><use href="#ray1" transform="rotate(185.625,150,150)"/><use href="#ray1" transform="rotate(191.25,150,150)"/><use href="#ray1" transform="rotate(196.875,150,150)"/><use href="#ray1" transform="rotate(202.5,150,150)"/><use href="#ray1" transform="rotate(208.125,150,150)"/><use href="#ray1" transform="rotate(213.75,150,150)"/><use href="#ray1" transform="rotate(219.375,150,150)"/><use href="#ray1" transform="rotate(225,150,150)"/><use href="#ray1" transform="rotate(230.625,150,150)"/><use href="#ray1" transform="rotate(236.25,150,150)"/><use href="#ray1" transform="rotate(241.875,150,150)"/><use href="#ray1" transform="rotate(247.5,150,150)"/><use href="#ray1" transform="rotate(253.125,150,150)"/><use href="#ray1" transform="rotate(258.75,150,150)"/><use href="#ray1" transform="rotate(264.375,150,150)"/><use href="#ray1" transform="rotate(270,150,150)"/><use href="#ray1" transform="rotate(275.625,150,150)"/><use href="#ray1" transform="rotate(281.25,150,150)"/><use href="#ray1" transform="rotate(286.875,150,150)"/><use href="#ray1" transform="rotate(292.5,150,150)"/><use href="#ray1" transform="rotate(298.125,150,150)"/><use href="#ray1" transform="rotate(303.75,150,150)"/><use href="#ray1" transform="rotate(309.375,150,150)"/><use href="#ray1" transform="rotate(315,150,150)"/><use href="#ray1" transform="rotate(320.625,150,150)"/><use href="#ray1" transform="rotate(326.25,150,150)"/><use href="#ray1" transform="rotate(331.875,150,150)"/><use href="#ray1" transform="rotate(337.5,150,150)"/><use href="#ray1" transform="rotate(343.125,150,150)"/><use href="#ray1" transform="rotate(348.75,150,150)"/><use href="#ray1" transform="rotate(354.375,150,150)"/></g></g><g id="Ether"><g><g><g><path class="cls-18" d="M150 197.383V241.872L95.999 162.99 150 197.383z"/><path class="cls-19" d="M150 242.27a.4.4.0 0 1-.328-.173l-54-78.883a.4.4.0 0 1 .542-.56l54 34.393a.4.4.0 0 1 .184.336v44.489a.4.4.0 0 1-.28.38A.4.4.0 0 1 150 242.27zm-52.574-77.9L149.6 240.587V197.6z"/></g><g><path class="cls-20" d="M204.001 162.99 150 241.872V197.383L204.001 162.99z"/><path class="cls-19" d="M150 242.27a.4.4.0 0 1-.118-.018.4.4.0 0 1-.28-.38V197.383a.4.4.0 0 1 .184-.336l54-34.393a.4.4.0 0 1 .542.56l-54 78.883A.4.4.0 0 1 150 242.27zm.4-44.669v42.986l52.176-76.217z"/></g><g><path class="cls-21" d="M204.001 151.877 150 121.192v65.079L204.001 151.877z"/><path class="cls-19" d="M150 186.668a.4.4.0 0 1-.4-.4V121.192a.4.4.0 0 1 .595-.345l54 30.685a.4.4.0 0 1 .017.681l-54 34.393A.392.392.0 0 1 150 186.668zm.4-64.792v63.67L203.23 151.9z"/></g><g><path class="cls-22" d="M204.001 151.877 150 58.128V121.192L204.001 151.877z"/><path class="cls-19" d="M204 152.275a.394.394.0 0 1-.2-.052l-54-30.685a.4.4.0 0 1-.2-.346V58.128a.4.4.0 0 1 .743-.2l54 93.75a.4.4.0 0 1-.345.6zm-53.6-31.314 52.529 29.849L150.4 59.615z"/></g><g><path class="cls-23" d="M150 58.128V121.192L95.999 151.877 150 58.128z"/><path class="cls-19" d="M96 152.275a.4.4.0 0 1-.345-.6l54-93.75a.4.4.0 0 1 .743.2v63.064a.4.4.0 0 1-.2.346l-54 30.685A.394.394.0 0 1 96 152.275zm53.6-92.66-52.529 91.2L149.6 120.961z"/></g><g><path class="cls-24" d="M150 121.192v65.079L95.999 151.877 150 121.192z"/><path class="cls-19" d="M150 186.668a.392.392.0 0 1-.214-.062l-54-34.393a.4.4.0 0 1 .017-.681l54-30.685a.4.4.0 0 1 .595.345v65.079a.4.4.0 0 1-.4.4zM96.77 151.9 149.6 185.546v-63.67z"/></g></g><g><path class="cls-19" d="M203.788 162.654 150 196.911 96.212 162.654a.4.4.0 0 0-.542.56l54 78.883h.006c.007.01.018.015.026.024a.388.388.0 0 0 .155.109c.009.0.014.014.023.017a.4.4.0 0 0 .236.0c.009.0.014-.013.023-.017a.382.382.0 0 0 .155-.109c.008-.01.019-.014.026-.024h.006l54-78.883a.4.4.0 0 0-.542-.56zM149.6 197.6v42.986L97.426 164.37zm.8 42.986V197.6l52.176-33.231z"/><path class="cls-19" d="M95.609 151.9a.42.42.0 0 0 .017.07.364.364.0 0 0 .071.145c.01.012.009.029.02.04a.352.352.0 0 0 .045.03c.009.007.013.019.023.025l54 34.393h.013l.01.01a.4.4.0 0 0 .382.0l.01-.01h.013l54-34.393c.01-.006.014-.018.023-.025a.352.352.0 0 0 .045-.03c.011-.011.01-.028.02-.04a.364.364.0 0 0 .071-.145.42.42.0 0 0 .017-.07c0-.012.008-.023.008-.035a.394.394.0 0 0-.05-.172s0-.012.0-.017v0h0l-54-93.744c0-.007-.012-.012-.017-.02a.406.406.0 0 0-.042-.051.309.309.0 0 0-.046-.043.346.346.0 0 0-.052-.032.278.278.0 0 0-.063-.029.214.214.0 0 0-.022-.01c-.012.0-.024.0-.036.0a.371.371.0 0 0-.067-.006.379.379.0 0 0-.067.006c-.012.0-.024.0-.036.0a.229.229.0 0 0-.023.01.371.371.0 0 0-.061.028.315.315.0 0 0-.053.033.361.361.0 0 0-.045.042.312.312.0 0 0-.043.053c0 .007-.012.012-.017.019l-54 93.744h0v0s0 .012.0.017a.394.394.0 0 0-.05.172C95.6 151.88 95.609 151.891 95.609 151.9zM149.6 121.876v63.67L96.77 151.9zm.8 63.67v-63.67L203.23 151.9zm0-64.585V59.615l52.529 91.2zm-.8-61.346v61.346L97.073 150.81z"/></g></g></g><g id="Ring"><g id="rotatethis"><path class="cls-25" d="M149.087 24.038A125.962 125.962.0 1 0 275.049 150 125.962 125.962.0 0 0 149.087 24.038zm0 225.281A99.319 99.319.0 1 1 248.406 150 99.319 99.319.0 0 1 149.087 249.319z"/><path id="textcircle" class="cls-1" d="M32 150a118 118 0 1 0 236 0 118 118 0 1 0-236 0"><animateTransform attributeName="transform" begin="0" dur="50s" type="rotate" from="0 150 150" to="360 150 150" repeatCount="indefinite"/></path></g></g><defs><style>text{font-size:16px;font-family:Helvetica,sans-serif;font-weight:900;letter-spacing:0;fill:#fff;letter-spacing:1px}#Ether,#Ring,#background{filter:hue-rotate(',
        generateConfigString(_tokenBaseFee, fireHeight, _readableBaseFee, _owner,_tokenId)
        ));

      return svg;
  }

  function tokenURI(uint256 _tokenId, uint256 _tokenBaseFee, address _owner, uint256 _minBaseFee, uint256 _maxBaseFee) internal pure returns (string memory) {

      string memory name = string(abi.encodePacked('Burny banner ',Strings.toString(_tokenId)));
      string memory readableBaseFee = '';

      if(_tokenBaseFee/uint(1000000000) > 0) {
        readableBaseFee = string(abi.encodePacked(Strings.toString(_tokenBaseFee/uint(1000000000)), ' Gwei'));
      } else {
        readableBaseFee = string(abi.encodePacked(Strings.toString(_tokenBaseFee), ' wei'));
      }

      string memory description = string(abi.encodePacked('When this was minted, the basefee was ',readableBaseFee));
      string memory image = Base64.encode(bytes(generateSVGofTokenById(_tokenId,  _tokenBaseFee, readableBaseFee, _owner, _minBaseFee, _maxBaseFee)));

      return
          string(
              abi.encodePacked(
                'data:application/json;base64,',
                Base64.encode(
                    bytes(
                          abi.encodePacked(
                              '{"name":"',
                              name,
                              '", "description":"',
                              description,
                              '", "image_data": "',
                              'data:image/svg+xml;base64,',
                              image,
                              '"}'
                          )
                        )
                    )
              )
          );
  }

}
