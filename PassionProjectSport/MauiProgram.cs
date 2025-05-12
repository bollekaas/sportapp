using CommunityToolkit.Maui;
using Microsoft.Extensions.Logging;
using PassionProjectSport.Classes;
using PassionProjectSport.Session;

namespace PassionProjectSport;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .UseMauiCommunityToolkit()
            .ConfigureFonts(fonts => { fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular"); });

        builder.Services.AddMauiBlazorWebView();
        builder.Services.AddSingleton<WorkoutState>();
        builder.Services.AddSingleton<Appsession>();

#if DEBUG
        builder.Services.AddBlazorWebViewDeveloperTools();
        builder.Logging.AddDebug();
        
#endif

        return builder.Build();
    }
}