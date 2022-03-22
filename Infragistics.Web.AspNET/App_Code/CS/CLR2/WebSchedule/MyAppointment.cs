using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for MyAppointment
/// </summary>
public class MyAppointment
{
    private int _id;
    public int ID
    {
        get { return _id; }
        set
        {
            _id = value;
        }
    }

    private DateTime _startDateTimeUtc;
    public DateTime StartDateTimeUtc
    {
        get { return _startDateTimeUtc; }
        set
        {
            _startDateTimeUtc = value;
        }
    }

    private int _duration;
    public int Duration
    {
        get { return _duration; }
        set
        {
            _duration = value;
        }
    }

    private string _subject;
    public string Subject
    {
        get { return _subject; }
        set
        {
            _subject = value;
        }
    }

    private bool _allDayEvent;
    public bool AllDayEvent
    {
        get { return _allDayEvent; }
        set
        {
            _allDayEvent = value;
        }
    }

    private string _location;
    public string Location
    {
        get { return _location; }
        set
        {
            _location = value;
        }
    }

    private string _description;
    public string Description
    {
        get { return _description; }
        set
        {
            _description = value;
        }
    }

    private int _status;
    public int Status
    {
        get { return _status; }
        set
        {
            _status = value;
        }
    }

    private bool _enableReminders;
    public bool EnableReminders
    {
        get { return _enableReminders; }
        set
        {
            _enableReminders = value;
        }
    }

    private int _showTimeAs;
    public int ShowTimeAs
    {
        get { return _showTimeAs; }
        set
        {
            _showTimeAs = value;
        }
    }

    private int _importance;
    public int Importance
    {
        get { return _importance; }
        set
        {
            _importance = value;
        }
    }

    private string _varianceID;
    public string VarianceID
    {
        get { return _varianceID; }
        set
        {
            _varianceID = value;
        }
    }

    private string _recurrencePattern;
    public string RecurrencePattern
    {
        get { return _recurrencePattern; }
        set
        {
            _recurrencePattern = value;
        }
    }

    private int _recurrenceID;
    public int RecurrenceID
    {
        get { return _recurrenceID; }
        set
        {
            _recurrenceID = value;
        }
    }

    private DateTime? _originalStartDateTimeUtc;

    public DateTime? OriginalStartDateTimeUtc
    {
        get
        {
            return _originalStartDateTimeUtc;
        }

        set
        {
            this._originalStartDateTimeUtc = value;
        }
    }

    private string _resourceKey;
    public string ResourceKey
    {
        get { return _resourceKey; }
        set
        {
            _resourceKey = value;
        }
    }

    public MyAppointment()
    {

    }

    public MyAppointment(int id,
                        DateTime startDateTimeUtc,
                        int duration,
                        string subject,
                        bool allDayEvent,
                        string location,
                        string description,
                        int status,
                        bool enableReminders,
                        int showTimeAs,
                        int importance,
                        string varianceID,
                        string recurrencePattern,
                        int recurrenceID,
                        object originalStartDateTimeUtc,
                        string resourceKey)
    {
        StartDateTimeUtc = startDateTimeUtc;
        Duration = duration;
        Subject = subject;
        AllDayEvent = allDayEvent;
        Location = location;
        Description = description;
        Status = status;
        EnableReminders = enableReminders;
        ShowTimeAs = showTimeAs;
        Importance = importance;
        VarianceID = varianceID;
        RecurrencePattern = recurrencePattern;
        RecurrenceID = recurrenceID;
        OriginalStartDateTimeUtc = originalStartDateTimeUtc as DateTime?;
        ResourceKey = resourceKey;
    }
}
