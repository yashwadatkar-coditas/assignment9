// setting_screen.dart
import 'package:assignment9/core/language_model/language_model.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_bloc.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_event.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var groupValue = context.read<LanguageBloc>().state.locale.languageCode; 
   
    return BlocConsumer<LanguageBloc,LanguageState>(
      
      builder: 
    
    
    (context, state) {
       
       return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: GoogleFonts.heebo(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: 
        
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.user,
                      style: GoogleFonts.heebo(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: languageModel.length,
                  itemBuilder: (context, index) {
                    var item = languageModel[index]; 

                    return RadioListTile(
                      value: item.languageCode,
                      groupValue: groupValue,
                      onChanged: (value) {
                       BlocProvider.of<LanguageBloc>(context).add(LoadLocalizationEvent(locale: Locale(item.languageCode)));
                       context.push('/home');
                      },
                      title: Text(item.language),
                      subtitle: Text(item.sublanguage),
                    );
                  },
                ),
              ),
              Divider(),
              Text(
                AppLocalizations.of(context)!.logout,
                style: GoogleFonts.heebo(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
    ),);
    },
     listener: (context, state) {
       groupValue = state.locale.languageCode;
     },);
   
        
    
    
  }
}
