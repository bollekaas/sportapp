using CommunityToolkit.Maui.Alerts;

namespace PassionProjectSport.Classes;
using CommunityToolkit.Maui.Core;

public class Notification
{
    private ToastDuration _duration;
    public async void Show(string message, string duration = "short")
    {
        CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();

        _duration = duration == "short" ? ToastDuration.Short : ToastDuration.Long;

        var toast = Toast.Make(message, _duration);

        await toast.Show(cancellationTokenSource.Token);
    }
}