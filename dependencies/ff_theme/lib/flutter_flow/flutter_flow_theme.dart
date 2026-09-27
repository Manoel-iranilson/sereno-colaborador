// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color slate50;
  late Color slate100;
  late Color slate200;
  late Color slate300;
  late Color slate400;
  late Color slate500;
  late Color slate600;
  late Color slate700;
  late Color slate800;
  late Color slate900;
  late Color slate950;
  late Color gray50;
  late Color gray100;
  late Color gray200;
  late Color gray300;
  late Color gray400;
  late Color gray500;
  late Color gray600;
  late Color gray700;
  late Color gray800;
  late Color gray900;
  late Color gray950;
  late Color zinc50;
  late Color zinc100;
  late Color zinc200;
  late Color zinc300;
  late Color zinc400;
  late Color zinc500;
  late Color zinc600;
  late Color zinc700;
  late Color zinc800;
  late Color zinc900;
  late Color zinc950;
  late Color neutral50;
  late Color neutral100;
  late Color neutral200;
  late Color neutral300;
  late Color neutral400;
  late Color neutral500;
  late Color neutral600;
  late Color neutral700;
  late Color neutral800;
  late Color neutral900;
  late Color neutral950;
  late Color stone50;
  late Color stone100;
  late Color stone200;
  late Color stone300;
  late Color stone400;
  late Color stone500;
  late Color stone600;
  late Color stone700;
  late Color stone800;
  late Color stone900;
  late Color stone950;
  late Color red50;
  late Color red100;
  late Color red200;
  late Color red300;
  late Color red400;
  late Color red500;
  late Color red600;
  late Color red700;
  late Color red800;
  late Color red900;
  late Color red950;
  late Color orange50;
  late Color orange100;
  late Color orange200;
  late Color orange300;
  late Color orange400;
  late Color orange500;
  late Color orange600;
  late Color orange700;
  late Color orange800;
  late Color orange900;
  late Color orange950;
  late Color amber50;
  late Color amber100;
  late Color amber200;
  late Color amber300;
  late Color amber400;
  late Color amber500;
  late Color amber600;
  late Color amber700;
  late Color amber800;
  late Color amber900;
  late Color amber950;
  late Color yellow50;
  late Color yellow100;
  late Color yellow200;
  late Color yellow300;
  late Color yellow400;
  late Color yellow500;
  late Color yellow600;
  late Color yellow700;
  late Color yellow800;
  late Color yellow900;
  late Color yellow950;
  late Color lime50;
  late Color lime100;
  late Color lime200;
  late Color lime300;
  late Color lime400;
  late Color lime500;
  late Color lime600;
  late Color lime700;
  late Color lime800;
  late Color lime900;
  late Color lime950;
  late Color green50;
  late Color green100;
  late Color green200;
  late Color green300;
  late Color green400;
  late Color green500;
  late Color green600;
  late Color green700;
  late Color green800;
  late Color green900;
  late Color green950;
  late Color emerald50;
  late Color emerald100;
  late Color emerald200;
  late Color emerald300;
  late Color emerald400;
  late Color emerald500;
  late Color emerald600;
  late Color emerald700;
  late Color emerald800;
  late Color emerald900;
  late Color emerald950;
  late Color teal50;
  late Color teal100;
  late Color teal200;
  late Color teal300;
  late Color teal400;
  late Color teal500;
  late Color teal600;
  late Color teal700;
  late Color teal800;
  late Color teal900;
  late Color teal950;
  late Color cyan50;
  late Color cyan100;
  late Color cyan200;
  late Color cyan300;
  late Color cyan400;
  late Color cyan500;
  late Color cyan600;
  late Color cyan700;
  late Color cyan800;
  late Color cyan900;
  late Color cyan950;
  late Color sky50;
  late Color sky100;
  late Color sky200;
  late Color sky300;
  late Color sky400;
  late Color sky500;
  late Color sky600;
  late Color sky700;
  late Color sky800;
  late Color sky900;
  late Color sky950;
  late Color blue50;
  late Color blue100;
  late Color blue200;
  late Color blue300;
  late Color blue400;
  late Color blue500;
  late Color blue600;
  late Color blue700;
  late Color blue800;
  late Color blue900;
  late Color blue950;
  late Color indigo50;
  late Color indigo100;
  late Color indigo200;
  late Color indigo300;
  late Color indigo400;
  late Color indigo500;
  late Color indigo600;
  late Color indigo700;
  late Color indigo800;
  late Color indigo900;
  late Color indigo950;
  late Color violet50;
  late Color violet100;
  late Color violet200;
  late Color violet300;
  late Color violet400;
  late Color violet500;
  late Color violet600;
  late Color violet700;
  late Color violet800;
  late Color violet900;
  late Color violet950;
  late Color purple50;
  late Color purple100;
  late Color purple200;
  late Color purple300;
  late Color purple400;
  late Color purple500;
  late Color purple600;
  late Color purple700;
  late Color purple800;
  late Color purple900;
  late Color purple950;
  late Color fuchsia50;
  late Color fuchsia100;
  late Color fuchsia200;
  late Color fuchsia300;
  late Color fuchsia400;
  late Color fuchsia500;
  late Color fuchsia600;
  late Color fuchsia700;
  late Color fuchsia800;
  late Color fuchsia900;
  late Color fuchsia950;
  late Color pink50;
  late Color pink100;
  late Color pink200;
  late Color pink300;
  late Color pink400;
  late Color pink500;
  late Color pink600;
  late Color pink700;
  late Color pink800;
  late Color pink900;
  late Color pink950;
  late Color rose50;
  late Color rose100;
  late Color rose200;
  late Color rose300;
  late Color rose400;
  late Color rose500;
  late Color rose600;
  late Color rose700;
  late Color rose800;
  late Color rose900;
  late Color rose950;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF00897B);
  late Color secondary = const Color(0xFF00695C);
  late Color tertiary = const Color(0xFF264653);
  late Color alternate = const Color(0xFFF5F5F7);
  late Color primaryText = const Color(0xFF12151C);
  late Color secondaryText = const Color(0xFF5A5C60);
  late Color primaryBackground = const Color(0xFFF6F6F6);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF004D40);
  late Color accent2 = const Color(0xFF00897B);
  late Color accent3 = const Color(0xFFA52A2A);
  late Color accent4 = const Color(0xB3FFFFFF);
  late Color success = const Color(0xFF02CA79);
  late Color warning = const Color(0xFFC96F46);
  late Color error = const Color(0xFFE65454);
  late Color info = const Color(0xFFFFFFFF);

  late Color slate50 = const Color(0xFFF8FAFC);
  late Color slate100 = const Color(0xFFF1F5F9);
  late Color slate200 = const Color(0xFFE2E8F0);
  late Color slate300 = const Color(0xFFCBD5E1);
  late Color slate400 = const Color(0xFF94A3B8);
  late Color slate500 = const Color(0xFF64748B);
  late Color slate600 = const Color(0xFF475569);
  late Color slate700 = const Color(0xFF334155);
  late Color slate800 = const Color(0xFF1E293B);
  late Color slate900 = const Color(0xFF0F172A);
  late Color slate950 = const Color(0xFF020617);
  late Color gray50 = const Color(0xFFF9FAFB);
  late Color gray100 = const Color(0xFFF3F4F6);
  late Color gray200 = const Color(0xFFE5E7EB);
  late Color gray300 = const Color(0xFFD1D5DB);
  late Color gray400 = const Color(0xFF9CA3AF);
  late Color gray500 = const Color(0xFF6B7280);
  late Color gray600 = const Color(0xFF4B5563);
  late Color gray700 = const Color(0xFF374151);
  late Color gray800 = const Color(0xFF1F2937);
  late Color gray900 = const Color(0xFF111827);
  late Color gray950 = const Color(0xFF030712);
  late Color zinc50 = const Color(0xFFFAFAFA);
  late Color zinc100 = const Color(0xFFF4F4F5);
  late Color zinc200 = const Color(0xFFE4E4E7);
  late Color zinc300 = const Color(0xFFD4D4D8);
  late Color zinc400 = const Color(0xFFA1A1AA);
  late Color zinc500 = const Color(0xFF71717A);
  late Color zinc600 = const Color(0xFF52525B);
  late Color zinc700 = const Color(0xFF3F3F46);
  late Color zinc800 = const Color(0xFF27272A);
  late Color zinc900 = const Color(0xFF18181B);
  late Color zinc950 = const Color(0xFF09090B);
  late Color neutral50 = const Color(0xFFFAFAFA);
  late Color neutral100 = const Color(0xFFF5F5F5);
  late Color neutral200 = const Color(0xFFE5E5E5);
  late Color neutral300 = const Color(0xFFD4D4D4);
  late Color neutral400 = const Color(0xFFA3A3A3);
  late Color neutral500 = const Color(0xFF737373);
  late Color neutral600 = const Color(0xFF525252);
  late Color neutral700 = const Color(0xFF404040);
  late Color neutral800 = const Color(0xFF262626);
  late Color neutral900 = const Color(0xFF171717);
  late Color neutral950 = const Color(0xFF0A0A0A);
  late Color stone50 = const Color(0xFFFAFAF9);
  late Color stone100 = const Color(0xFFF5F5F4);
  late Color stone200 = const Color(0xFFE7E5E4);
  late Color stone300 = const Color(0xFFD6D3D1);
  late Color stone400 = const Color(0xFFA8A29E);
  late Color stone500 = const Color(0xFF78716C);
  late Color stone600 = const Color(0xFF57534E);
  late Color stone700 = const Color(0xFF44403C);
  late Color stone800 = const Color(0xFF292524);
  late Color stone900 = const Color(0xFF1C1917);
  late Color stone950 = const Color(0xFF0C0A09);
  late Color red50 = const Color(0xFFFEF2F2);
  late Color red100 = const Color(0xFFFEE2E2);
  late Color red200 = const Color(0xFFFECACA);
  late Color red300 = const Color(0xFFFCA5A5);
  late Color red400 = const Color(0xFFF87171);
  late Color red500 = const Color(0xFFEF4444);
  late Color red600 = const Color(0xFFDC2626);
  late Color red700 = const Color(0xFFB91C1C);
  late Color red800 = const Color(0xFF991B1B);
  late Color red900 = const Color(0xFF7F1D1D);
  late Color red950 = const Color(0xFF450A0A);
  late Color orange50 = const Color(0xFFFFF7ED);
  late Color orange100 = const Color(0xFFFFEDD5);
  late Color orange200 = const Color(0xFFFED7AA);
  late Color orange300 = const Color(0xFFFDBA74);
  late Color orange400 = const Color(0xFFFB923C);
  late Color orange500 = const Color(0xFFF97316);
  late Color orange600 = const Color(0xFFEA580C);
  late Color orange700 = const Color(0xFFC2410C);
  late Color orange800 = const Color(0xFF9A3412);
  late Color orange900 = const Color(0xFF7C2D12);
  late Color orange950 = const Color(0xFF431407);
  late Color amber50 = const Color(0xFFFFFBEB);
  late Color amber100 = const Color(0xFFFEF3C7);
  late Color amber200 = const Color(0xFFFDE68A);
  late Color amber300 = const Color(0xFFFCD34D);
  late Color amber400 = const Color(0xFFFBBF24);
  late Color amber500 = const Color(0xFFF59E0B);
  late Color amber600 = const Color(0xFFD97706);
  late Color amber700 = const Color(0xFFB45309);
  late Color amber800 = const Color(0xFF92400E);
  late Color amber900 = const Color(0xFF78350F);
  late Color amber950 = const Color(0xFF451A03);
  late Color yellow50 = const Color(0xFFFEFCE8);
  late Color yellow100 = const Color(0xFFFEF9C3);
  late Color yellow200 = const Color(0xFFFEF08A);
  late Color yellow300 = const Color(0xFFFDE047);
  late Color yellow400 = const Color(0xFFFACC15);
  late Color yellow500 = const Color(0xFFEAB308);
  late Color yellow600 = const Color(0xFFCA8A04);
  late Color yellow700 = const Color(0xFFA16207);
  late Color yellow800 = const Color(0xFF854D0E);
  late Color yellow900 = const Color(0xFF713F12);
  late Color yellow950 = const Color(0xFF422006);
  late Color lime50 = const Color(0xFFF7FEE7);
  late Color lime100 = const Color(0xFFECFCCB);
  late Color lime200 = const Color(0xFFD9F99D);
  late Color lime300 = const Color(0xFFBEF264);
  late Color lime400 = const Color(0xFFA3E635);
  late Color lime500 = const Color(0xFF84CC16);
  late Color lime600 = const Color(0xFF65A30D);
  late Color lime700 = const Color(0xFF4D7C0F);
  late Color lime800 = const Color(0xFF3F6212);
  late Color lime900 = const Color(0xFF365314);
  late Color lime950 = const Color(0xFF1A2E05);
  late Color green50 = const Color(0xFFF0FDF4);
  late Color green100 = const Color(0xFFDCFCE7);
  late Color green200 = const Color(0xFFBBF7D0);
  late Color green300 = const Color(0xFF86EFAC);
  late Color green400 = const Color(0xFF4ADE80);
  late Color green500 = const Color(0xFF22C55E);
  late Color green600 = const Color(0xFF16A34A);
  late Color green700 = const Color(0xFF15803D);
  late Color green800 = const Color(0xFF166534);
  late Color green900 = const Color(0xFF14532D);
  late Color green950 = const Color(0xFF052E16);
  late Color emerald50 = const Color(0xFFECFDF5);
  late Color emerald100 = const Color(0xFFD1FAE5);
  late Color emerald200 = const Color(0xFFA7F3D0);
  late Color emerald300 = const Color(0xFF6EE7B7);
  late Color emerald400 = const Color(0xFF34D399);
  late Color emerald500 = const Color(0xFF10B981);
  late Color emerald600 = const Color(0xFF059669);
  late Color emerald700 = const Color(0xFF047857);
  late Color emerald800 = const Color(0xFF065F46);
  late Color emerald900 = const Color(0xFF064E3B);
  late Color emerald950 = const Color(0xFF022C22);
  late Color teal50 = const Color(0xFFF0FDFA);
  late Color teal100 = const Color(0xFFCCFBF1);
  late Color teal200 = const Color(0xFF99F6E4);
  late Color teal300 = const Color(0xFF5EEAD4);
  late Color teal400 = const Color(0xFF2DD4BF);
  late Color teal500 = const Color(0xFF14B8A6);
  late Color teal600 = const Color(0xFF0D9488);
  late Color teal700 = const Color(0xFF0F766E);
  late Color teal800 = const Color(0xFF115E59);
  late Color teal900 = const Color(0xFF134E4A);
  late Color teal950 = const Color(0xFF042F2E);
  late Color cyan50 = const Color(0xFFECFEFF);
  late Color cyan100 = const Color(0xFFCFFAFE);
  late Color cyan200 = const Color(0xFFA5F3FC);
  late Color cyan300 = const Color(0xFF67E8F9);
  late Color cyan400 = const Color(0xFF22D3EE);
  late Color cyan500 = const Color(0xFF06B6D4);
  late Color cyan600 = const Color(0xFF0891B2);
  late Color cyan700 = const Color(0xFF0E7490);
  late Color cyan800 = const Color(0xFF155E75);
  late Color cyan900 = const Color(0xFF164E63);
  late Color cyan950 = const Color(0xFF083344);
  late Color sky50 = const Color(0xFFF0F9FF);
  late Color sky100 = const Color(0xFFE0F2FE);
  late Color sky200 = const Color(0xFFBAE6FD);
  late Color sky300 = const Color(0xFF7DD3FC);
  late Color sky400 = const Color(0xFF38BDF8);
  late Color sky500 = const Color(0xFF0EA5E9);
  late Color sky600 = const Color(0xFF0284C7);
  late Color sky700 = const Color(0xFF0369A1);
  late Color sky800 = const Color(0xFF075985);
  late Color sky900 = const Color(0xFF0C4A6E);
  late Color sky950 = const Color(0xFF082F49);
  late Color blue50 = const Color(0xFFEFF6FF);
  late Color blue100 = const Color(0xFFDBEAFE);
  late Color blue200 = const Color(0xFFBFDBFE);
  late Color blue300 = const Color(0xFF93C5FD);
  late Color blue400 = const Color(0xFF60A5FA);
  late Color blue500 = const Color(0xFF3B82F6);
  late Color blue600 = const Color(0xFF2563EB);
  late Color blue700 = const Color(0xFF1D4ED8);
  late Color blue800 = const Color(0xFF1E40AF);
  late Color blue900 = const Color(0xFF1E3A8A);
  late Color blue950 = const Color(0xFF172554);
  late Color indigo50 = const Color(0xFFEEF2FF);
  late Color indigo100 = const Color(0xFFE0E7FF);
  late Color indigo200 = const Color(0xFFC7D2FE);
  late Color indigo300 = const Color(0xFFA5B4FC);
  late Color indigo400 = const Color(0xFF818CF8);
  late Color indigo500 = const Color(0xFF6366F1);
  late Color indigo600 = const Color(0xFF4F46E5);
  late Color indigo700 = const Color(0xFF4338CA);
  late Color indigo800 = const Color(0xFF3730A3);
  late Color indigo900 = const Color(0xFF312E81);
  late Color indigo950 = const Color(0xFF1E1B4B);
  late Color violet50 = const Color(0xFFF5F3FF);
  late Color violet100 = const Color(0xFFEDE9FE);
  late Color violet200 = const Color(0xFFDDD6FE);
  late Color violet300 = const Color(0xFFC4B5FD);
  late Color violet400 = const Color(0xFFA78BFA);
  late Color violet500 = const Color(0xFF8B5CF6);
  late Color violet600 = const Color(0xFF7C3AED);
  late Color violet700 = const Color(0xFF6D28D9);
  late Color violet800 = const Color(0xFF5B21B6);
  late Color violet900 = const Color(0xFF4C1D95);
  late Color violet950 = const Color(0xFF2E1065);
  late Color purple50 = const Color(0xFFFAF5FF);
  late Color purple100 = const Color(0xFFF3E8FF);
  late Color purple200 = const Color(0xFFE9D5FF);
  late Color purple300 = const Color(0xFFD8B4FE);
  late Color purple400 = const Color(0xFFC084FC);
  late Color purple500 = const Color(0xFFA855F7);
  late Color purple600 = const Color(0xFF9333EA);
  late Color purple700 = const Color(0xFF7E22CE);
  late Color purple800 = const Color(0xFF6B21A8);
  late Color purple900 = const Color(0xFF581C87);
  late Color purple950 = const Color(0xFF3B0764);
  late Color fuchsia50 = const Color(0xFFFDF4FF);
  late Color fuchsia100 = const Color(0xFFFAE8FF);
  late Color fuchsia200 = const Color(0xFFF5D0FE);
  late Color fuchsia300 = const Color(0xFFF0ABFC);
  late Color fuchsia400 = const Color(0xFFE879F9);
  late Color fuchsia500 = const Color(0xFFD946EF);
  late Color fuchsia600 = const Color(0xFFC026D3);
  late Color fuchsia700 = const Color(0xFFA21CAF);
  late Color fuchsia800 = const Color(0xFF86198F);
  late Color fuchsia900 = const Color(0xFF701A75);
  late Color fuchsia950 = const Color(0xFF4A044E);
  late Color pink50 = const Color(0xFFFDF2F8);
  late Color pink100 = const Color(0xFFFCE7F3);
  late Color pink200 = const Color(0xFFFBCFE8);
  late Color pink300 = const Color(0xFFF9A8D4);
  late Color pink400 = const Color(0xFFF472B6);
  late Color pink500 = const Color(0xFFEC4899);
  late Color pink600 = const Color(0xFFDB2777);
  late Color pink700 = const Color(0xFFBE185D);
  late Color pink800 = const Color(0xFF9D174D);
  late Color pink900 = const Color(0xFF831843);
  late Color pink950 = const Color(0xFF500724);
  late Color rose50 = const Color(0xFFFFF1F2);
  late Color rose100 = const Color(0xFFFFE4E6);
  late Color rose200 = const Color(0xFFFECDD3);
  late Color rose300 = const Color(0xFFFDA4AF);
  late Color rose400 = const Color(0xFFFB7185);
  late Color rose500 = const Color(0xFFF43F5E);
  late Color rose600 = const Color(0xFFE11D48);
  late Color rose700 = const Color(0xFFBE123C);
  late Color rose800 = const Color(0xFF9F1239);
  late Color rose900 = const Color(0xFF881337);
  late Color rose950 = const Color(0xFF4C0519);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Readex Pro';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 60.0,
      );
  String get displayMediumFamily => 'Readex Pro';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Readex Pro';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineLargeFamily => 'Readex Pro';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Readex Pro';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get headlineSmallFamily => 'Readex Pro';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Readex Pro';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.readexPro(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Readex Pro';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.readexPro(
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Inter';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.inter(
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Inter';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.inter(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Inter';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.inter(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Inter';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.inter(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Inter';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.inter(
        color: theme.primaryText,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Inter';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Inter';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
