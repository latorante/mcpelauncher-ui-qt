#ifndef APKEXTRACTIONTASK_H
#define APKEXTRACTIONTASK_H

#include <QThread>
#include <QMutex>
#include <QTemporaryDir>

class VersionManager;

class ApkExtractionTask : public QThread
{
    Q_OBJECT
    Q_PROPERTY(VersionManager* versionManager READ versionManager WRITE setVersionManager)
    Q_PROPERTY(QString source READ source WRITE setSource)

    QMutex mutex;
    QString m_source;
    VersionManager* m_versionManager;

    void run() override;

public:
    explicit ApkExtractionTask(QObject *parent = nullptr);

    QString source() {
        QMutexLocker locker(&mutex);
        return m_source;
    }

    void setSource(QString const& value) {
        QMutexLocker locker(&mutex);
        m_source = value;
    }

    VersionManager* versionManager() {
        QMutexLocker locker(&mutex);
        return m_versionManager;
    }

    void setVersionManager(VersionManager* value) {
        QMutexLocker locker(&mutex);
        m_versionManager = value;
    }
public slots:
    bool setSourceUrl(QUrl const& url);

signals:
    void progress(qreal progress);

    void finished();

    void error(QString const& err);

};

#endif // APKEXTRACTIONTASK_H